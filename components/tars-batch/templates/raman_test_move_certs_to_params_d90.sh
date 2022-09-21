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

d90_pk12_password=$(${aws} ssm get-parameter --name "/raman-test/d90/test/keystore/passwords/d90-test-pk12" --with-decryption --query 'Parameter.Value' --output text)
d90_trust_store_password=$(${aws} ssm get-parameter --name "/raman-test/d90/keystore/passwords/d90-trust-store" --with-decryption --query 'Parameter.Value' --output text)


# cert chain
#d90-soap-wrapper\certificates\D90_SOAP_TEST-2022B.crt
#d90-soap-wrapper\certificates\dvla-UASERVICES04-CA.crt
#d90-soap-wrapper\certificates\dvla-UASERVICES03-CA.crt

${aws} ssm get-parameter --name "/raman-test/d90/test/D90_SOAP_TEST-2022B-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/D90_SOAP_TEST-2022B.crt
${aws} ssm get-parameter --name "/raman-test/d90/test/D90_SOAP_TEST-2022B-private" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/D90_SOAP_TEST-2022B_private.key


# get root and intermediate
${aws} ssm get-parameter --name "/raman-test/d90/test/dvla-UASERVICES04-CA-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/dvla-UASERVICES04-CA.crt
${aws} ssm get-parameter --name "/raman-test/d90/test/dvla-UASERVICES03-CA-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/dvla-UASERVICES03-CA.crt

# create d90 test chain
cat /tmp/cert/D90_SOAP_TEST-2022B.crt /tmp/cert/dvla-UASERVICES04-CA.crt /tmp/cert/dvla-UASERVICES03-CA.crt > /tmp/cert/d90-test-chain.pem

# create pkcs12
openssl pkcs12 -export -inkey /tmp/cert/D90_SOAP_TEST-2022B_private.key -in /tmp/cert/D90_SOAP_TEST-2022B.crt -certfile /tmp/cert/d90-test-chain.pem -name d90_soap_test -out /tmp/cert/d90TEST.p12 -passout pass:$d90_pk12_password

# create d90 test key store
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importkeystore -srckeystore /tmp/cert/d90TEST.p12 -srcstoretype pkcs12 -destkeystore /tmp/cert/keystores/d90_soap_test_client.jks -deststorepass $d90_pk12_password -srcstorepass $d90_pk12_password

# create d90 trust store (same for prod and test)
#Alias name: digitcertroot20281022 (should be intermediate) = INTERMEDIATE-DigiCert-SHA2-Extended-Validation-Server-CA.crt
#Alias name: digitcertroot20311110 = ROOT-DigiCert-High-Assurance-EV-Root-CA.crt
#Alias name: dvla-uaservices03-ca = dvla-UASERVICES03-CA.crt
#Alias name: dvla-uaservices04-ca = dvla-UASERVICES04-CA.crt
#Alias name: quovadis-ev-ssl-ica-g1 = QuoVadisEVSSLICAG1.cer/QuoVadisEVSSLICAG1.pem
#Alias name: quovadis-root-ca-2 = QuoVadisRoot.pem.cer
#Alias name: quovadis-root-ca2-g3 = export from keystore
#Alias name: quovadis-ssl-ica-g3 = export from keystore
#Alias name: quovadis-ssl-ica-g3-new = export from keystore

${aws} ssm get-parameter --name "/raman-test/d90/shared/INTERMEDIATE-DigiCert-SHA2-Extended-Validation-Server-CA-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/INTERMEDIATE-DigiCert-SHA2-Extended-Validation-Server-CA.crt
${aws} ssm get-parameter --name "/raman-test/d90/shared/ROOT-DigiCert-High-Assurance-EV-Root-CA-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/ROOT-DigiCert-High-Assurance-EV-Root-CA.crt
${aws} ssm get-parameter --name "/raman-test/d90/shared/dvla-UASERVICES03-CA-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/dvla-UASERVICES03-CA.crt
${aws} ssm get-parameter --name "/raman-test/d90/shared/dvla-UASERVICES04-CA-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/dvla-UASERVICES04-CA.crt
${aws} ssm get-parameter --name "/raman-test/d90/shared/quovadis-ev-ssl-ica-g1-cer" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/QuoVadisEVSSLICAG1.cer
${aws} ssm get-parameter --name "/raman-test/d90/shared/QuoVadisRoot-pem-cer" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/QuoVadisRoot.pem.cer
${aws} ssm get-parameter --name "/raman-test/d90/shared/quovadis-root-ca2-g3-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/quovadis-root-ca2-g3.crt
${aws} ssm get-parameter --name "/raman-test/d90/shared/quovadis-ssl-ica-g3-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/quovadis-ssl-ica-g3.crt
${aws} ssm get-parameter --name "/raman-test/d90/shared/quovadis-ssl-ica-g3-new-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/quovadis-ssl-ica-g3-new.crt

/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/d90_trust_store.jks -deststorepass $d90_trust_store_password -file /tmp/cert/INTERMEDIATE-DigiCert-SHA2-Extended-Validation-Server-CA.crt -alias digitcertintermediate20281022
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/d90_trust_store.jks -deststorepass $d90_trust_store_password -file /tmp/cert/ROOT-DigiCert-High-Assurance-EV-Root-CA.crt -alias digitcertroot20311110 -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/d90_trust_store.jks -deststorepass $d90_trust_store_password -file /tmp/cert/dvla-UASERVICES03-CA.crt -alias dvla-uaservices03-ca -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/d90_trust_store.jks -deststorepass $d90_trust_store_password -file /tmp/cert/dvla-UASERVICES04-CA.crt -alias dvla-uaservices04-ca -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/d90_trust_store.jks -deststorepass $d90_trust_store_password -file /tmp/cert/QuoVadisEVSSLICAG1.cer -alias quovadis-ev-ssl-ica-g1 -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/d90_trust_store.jks -deststorepass $d90_trust_store_password -file /tmp/cert/QuoVadisRoot.pem.cer -alias quovadis-root-ca-2 -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/d90_trust_store.jks -deststorepass $d90_trust_store_password -file /tmp/cert/quovadis-root-ca2-g3.crt -alias quovadis-root-ca2-g3 -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/d90_trust_store.jks -deststorepass $d90_trust_store_password -file /tmp/cert/quovadis-ssl-ica-g3.crt -alias quovadis-ssl-ica-g3 -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/d90_trust_store.jks -deststorepass $d90_trust_store_password -file /tmp/cert/quovadis-ssl-ica-g3-new.crt -alias quovadis-ssl-ica-g3-new -noprompt

# test line to create folder
#mkdir -p /opt/d90wrapper/conf/

# copy keystore and truststore to d90
cp /tmp/cert/keystores/d90_soap_test_client.jks /opt/d90wrapper/conf/
cp /tmp/cert/keystores/d90_trust_store.jks /opt/d90wrapper/conf/
chown d90wrapper:d90wrapper /opt/d90wrapper/conf/d90_soap_test_client.jks
chown d90wrapper:d90wrapper /opt/d90wrapper/conf/d90_trust_store.jks 
chmod 750 /opt/d90wrapper/conf/d90_soap_test_client.jks
chmod 750 /opt/d90wrapper/conf/d90_trust_store.jks 

/etc/init.d/d90wrapper restart