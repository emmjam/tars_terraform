#!/bin/bash +x
# note $ need to double eg ${aws} should be $${aws}
# file paths will need to be corrected

mkdir /tmp/cert/
mkdir /tmp/cert/keystores
export aws="$(which aws || echo '/usr/bin/aws')";

# get keystore passwords
cpc_keystore_password=$(${aws} ssm get-parameter --name "/raman-test/elise-certs/keystore/passwords/cpc" --with-decryption --query 'Parameter.Value' --output text)
elise_keystore_password=$(${aws} ssm get-parameter --name "/raman-test/elise-certs/keystore/passwords/productionelise" --with-decryption --query 'Parameter.Value' --output text)
elise_pk12_password=$(${aws} ssm get-parameter --name "/raman-test/elise-certs/keystore/passwords/prod_elise-pk12" --with-decryption --query 'Parameter.Value' --output text)

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# prod elise
# get prod elise cert
${aws} ssm get-parameter --name "/raman-test/elise-certs/cpc-dvsa-gov-uk-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/cpc_dvsa_gov_uk.crt # signed cert
${aws} ssm get-parameter --name "/raman-test/elise-certs/cpc-dvsa-gov-uk-private" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/cpc_dvsa_gov_uk_private.key # private key

# get digicert root and intermediate certs
${aws} ssm get-parameter --name "/raman-test/elise-certs/TrustedRoot-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/TrustedRoot.crt
${aws} ssm get-parameter --name "/raman-test/elise-certs/DigiCertCA-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/DigiCertCA.crt

# get any additional certs to trust
${aws} ssm get-parameter --name "/raman-test/elise-certs/censysactivemqca-pem" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/censysactivemqca.pem
${aws} ssm get-parameter --name "/raman-test/elise-certs/quovadisglobal-pem" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/quovadisglobal.pem

# get elise root and intermediate certificates # can be crt or pem
${aws} ssm get-parameter --name "/raman-test/elise-certs/quovadisintermediate-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/quovadisintermediate.crt
${aws} ssm get-parameter --name "/raman-test/elise-certs/quovadisroot-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/quovadisroot.crt
${aws} ssm get-parameter --name "/raman-test/elise-certs/root-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/root.crt

#convert digicert root and intermediate to pem:
openssl x509 -in /tmp/cert/TrustedRoot.crt -out /tmp/cert/TrustedRoot.pem -outform PEM
openssl x509 -in /tmp/cert/DigiCertCA.crt -out /tmp/cert/DigiCertCA.pem -outform PEM

# combine digicert root and intermediate pems to make chain:
cat /tmp/cert/TrustedRoot.pem /tmp/cert/DigiCertCA.pem > /tmp/cert/ca-chain-bundle.cert.pem

#verify chain (will say self signed):
verify_chain=$(openssl verify -CAfile /tmp/cert/cpc_dvsa_gov_uk.crt /tmp/cert/ca-chain-bundle.cert.pem)

#convert to pk12:
#(name and password needs to match cpc variables but using a test password for now)
certKey="testing" # this needs to be got from parameter store and source and destination passwords will be different
# -name and -out filename will vary depending upon aws account
openssl pkcs12 -export -inkey /tmp/cert/cpc_dvsa_gov_uk_private.key -in /tmp/cert/cpc_dvsa_gov_uk.crt -certfile /tmp/cert/ca-chain-bundle.cert.pem -name prodelise -out /tmp/cert/prod_elise.p12 -passout pass:$elise_pk12_password

#verify pk12 file: this may not be needed
#openssl pkcs12 -info -in /tmp/cert/prod_elise.p12

# create cpc-wildfly-keystore.jks keystore
# add prod elise cert to keystore, dest and source passwords are just test values and should be retrieved from paramstore
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importkeystore -srckeystore /tmp/cert/prod_elise.p12 -srcstoretype pkcs12 -destkeystore /tmp/cert/keystores/cpc-wildfly-keystore.jks -deststorepass $cpc_keystore_password -srcstorepass $elise_pk12_password


# create cpc-wildfly-truststore.jks trust store
# add cert aliases to cpc-wildfly-truststore.jks trust store
#------------------------------------------------------------
#censysactivemqca         - 
#dvladigicertintermediate - DigiCertCA.pem 
#dvladigicertroot         - TrustedRoot.pem
#prodelise                - is not needed in cpc-wildfly-truststore.jks
#quovadisrootcatruststore - 
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/censysactivemqca.pem -alias censysactivemqca
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/DigiCertCA.crt -alias dvladigicertintermediate 
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/TrustedRoot.crt -alias dvladigicertroot -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/quovadisglobal.pem -alias quovadisrootcatruststore

# create productionelise-jssecacerts keystore
# add prod elise cert to productionelise-jssecacerts
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importkeystore -srckeystore /tmp/cert/prod_elise.p12 -srcstoretype pkcs12 -destkeystore /tmp/cert/keystores/productionelise-jssecacerts -deststorepass $elise_keystore_password -srcstorepass $elise_pk12_password

# productionelise-jssecacerts cert aliases
#cpc.dsa.gsi.gov.uk101019  - expiredn
#prodelise                 - prod_elise.p12
#quovadisintermediate      - quovadisglobal.pem
#quovadisroot
#root                      - TrustedRoot.pem

# add root and intermediate to productionelise-jssecacerts
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/productionelise-jssecacerts -deststorepass $elise_keystore_password -alias quovadisintermediate -file /tmp/cert/quovadisintermediate.crt  
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/productionelise-jssecacerts -deststorepass $elise_keystore_password -alias quovadisroot -file /tmp/cert/quovadisroot.crt -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/productionelise-jssecacerts -deststorepass $elise_keystore_password -alias root -file /tmp/cert/root.crt -noprompt


cp /tmp/cert/keystores/cpc-wildfly-keystore.jks /opt/wildfly/cpc_prop_home/wildfly-cipher/
cp /tmp/cert/keystores/cpc-wildfly-truststore.jks /opt/wildfly/cpc_prop_home/wildfly-cipher/
cp /tmp/cert/keystores/productionelise-jssecacerts /opt/wildfly/cpc_prop_home/wildfly-cipher/
chown d90wrapper:d90wrapper /opt/d90wrapper/conf/cpc-wildfly-keystore.jks
chown d90wrapper:d90wrapper /opt/d90wrapper/conf/cpc-wildfly-truststore.jks
chown d90wrapper:d90wrapper /opt/d90wrapper/conf/productionelise-jssecacerts
chmod 750 /opt/d90wrapper/conf/cpc-wildfly-keystore.jks
chmod 750 /opt/d90wrapper/conf/cpc-wildfly-truststore.jks
chmod 750 /opt/d90wrapper/conf/productionelise-jssecacerts
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



# copy keystore and truststores to the required location

# error trapping example
if [ $${?} -ne 0 ]; then
    error 'Unable to get cpc_dvsa_gov_uk_crt parameter';
  else
    log 'INFO' "Retrieved cpc_dvsa_gov_uk_crt parameter from parameter store";
fi;
