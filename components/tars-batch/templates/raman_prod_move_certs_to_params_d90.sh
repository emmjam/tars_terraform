#!/bin/bash +x
# note $ need to double eg ${aws} should be $${aws}
# file paths will need to be corrected

#/opt/d90wrapper/conf/

# params
#/raman-test/d90/prod/
#/raman-test/d90/test/

mkdir /tmp/cert/
mkdir -p /tmp/cert/keystores
export aws="$(which aws || echo '/usr/bin/aws')";

d90_pk12_password=$(${aws} ssm get-parameter --name "/raman-test/d90/test/keystore/passwords/d90-prod-pk12" --with-decryption --query 'Parameter.Value' --output text)
d90_trust_store_password=$(${aws} ssm get-parameter --name "/raman-test/d90/keystore/passwords/d90-trust-store" --with-decryption --query 'Parameter.Value' --output text)


# cert chain
#d90-soap-wrapper\certificates\D90_SOAP_TEST-2022B.crt
#d90-soap-wrapper\certificates\dvla-UASERVICES04-CA.crt
#d90-soap-wrapper\certificates\dvla-UASERVICES03-CA.crt

${aws} ssm get-parameter --name "/raman-test/d90/test/D90-SOAP-PROD-2022B-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/D90_SOAP_PROD-2022B.crt
${aws} ssm get-parameter --name "/raman-test/d90/test/D90-SOAP-PROD-2022B-private" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/D90_SOAP_PROD-2022B_private.key


# get root and intermediate
${aws} ssm get-parameter --name "/raman-test/d90/prod/services04-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/services04.crt
${aws} ssm get-parameter --name "/raman-test/d90/prod/services03-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/services03.crt

# create d90 test chain
cat /tmp/cert/D90_SOAP_PROD-2022B.crt /tmp/cert/services04.crt /tmp/cert/services03.crt > /tmp/cert/d90-prod-chain.pem

# create pkcs12
openssl pkcs12 -export -inkey /tmp/cert/D90_SOAP_PROD-2022B_private.key -in /tmp/cert/D90_SOAP_PROD-2022B.crt -certfile /tmp/cert/d90-prod-chain.pem -name d90_soap_test -out /tmp/cert/d90PROD.p12 -passout pass:$d90_pk12_password

# create d90 test key store
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importkeystore -srckeystore /tmp/cert/d90PROD.p12 -srcstoretype pkcs12 -destkeystore /tmp/cert/keystores/d90_soap_prod_client.jks -deststorepass $d90_pk12_password -srcstorepass $d90_pk12_password



# test line to create folder
#mkdir -p /opt/d90wrapper/conf/

# copy keystore and truststore to d90
cp /tmp/cert/keystores/d90_soap_prod_client.jks /opt/d90wrapper/conf/
cp /tmp/cert/keystores/d90_trust_store.jks /opt/d90wrapper/conf/
chown d90wrapper:d90wrapper /opt/d90wrapper/conf/d90_soap_prod_client.jks
chown d90wrapper:d90wrapper /opt/d90wrapper/conf/d90_trust_store.jks 
chmod 750 /opt/d90wrapper/conf/d90_soap_test_client.jks
chmod 750 /opt/d90wrapper/conf/d90_trust_store.jks 

/etc/init.d/d90wrapper restart