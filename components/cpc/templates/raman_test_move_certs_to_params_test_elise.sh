#!/bin/bash +x
# note $ need to double eg ${aws} should be $${aws}
# file paths will need to be corrected

mkdir /tmp/cert/
mkdir /tmp/cert/keystores
export aws="$(which aws || echo '/usr/bin/aws')";

# get keystore passwords
cpc_keystore_password=$(${aws} ssm get-parameter --name "/raman-test/elise-certs/keystore/passwords/cpc" --with-decryption --query 'Parameter.Value' --output text)
elise_keystore_password=$(${aws} ssm get-parameter --name "/raman-test/elise-certs/keystore/passwords/productionelise" --with-decryption --query 'Parameter.Value' --output text)
elise_pk12_password=$(${aws} ssm get-parameter --name "/raman-test/elise-certs/test/keystore/passwords/test_elise-pk12" --with-decryption --query 'Parameter.Value' --output text)

# test elise

# get non prod signed cert
#cpc-application\wildfly\src\main\resources\non-filtered-resources\testWildflyCertificates\wildfly-cipher\test-elise.pem > /raman-test/elise-certs/test/cpc-nonprod-dvsa-gov-uk-crt
${aws} ssm get-parameter --name "/raman-test/elise-certs/test/cpc-nonprod-dvsa-gov-uk-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/cpc-nonprod-dvsa-gov-uk.crt

# private key
#cpc-application\wildfly\src\main\resources\non-filtered-resources\testWildflyCertificates\wildfly-cipher\test-elise.key > /raman-test/elise-certs/test/cpc-nonprod-dvsa-gov-uk-private
${aws} ssm get-parameter --name "/raman-test/elise-certs/test/cpc-nonprod-dvsa-gov-uk-private" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/cpc-nonprod-dvsa-gov-uk-private.key

# get ca chain certs
# cpc-application\wildfly\src\main\resources\non-filtered-resources\testWildflyCertificates\wildfly-cipher\test-elise-chain.pem - too many characters to add to paramstore, need 3 instead
# - split into 1, 2 and 3
# - /raman-test/elise-certs/test/test-elise-chain-1
# - /raman-test/elise-certs/test/test-elise-chain-2
# - /raman-test/elise-certs/test/test-elise-chain-3
# download the 3 certs and append into 1 file
${aws} ssm get-parameter --name "/raman-test/elise-certs/test/test-elise-chain-1" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/test-elise-chain-1.pem
${aws} ssm get-parameter --name "/raman-test/elise-certs/test/test-elise-chain-2" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/test-elise-chain-2.pem
${aws} ssm get-parameter --name "/raman-test/elise-certs/test/test-elise-chain-3" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/test-elise-chain-3.pem

# make ca chain
cat /tmp/cert/test-elise-chain-1.pem /tmp/cert/test-elise-chain-2.pem /tmp/cert/test-elise-chain-3.pem > /tmp/cert/ca-chain-bundle.cert.pem

#convert to pk12:
openssl pkcs12 -export -inkey /tmp/cert/cpc-nonprod-dvsa-gov-uk-private.key -in /tmp/cert/cpc-nonprod-dvsa-gov-uk.crt -certfile /tmp/cert/ca-chain-bundle.cert.pem -name testelise -out /tmp/cert/temp_elise.p12 -passout pass:$elise_pk12_password

# create nonprod cpc wildfly key store
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importkeystore -srckeystore /tmp/cert/temp_elise.p12 -srcstoretype pkcs12 -destkeystore /tmp/cert/keystores/cpc-wildfly-keystore.jks -deststorepass $cpc_keystore_password -srcstorepass $elise_pk12_password

# create testelise-jssecacerts key store
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importkeystore -srckeystore /tmp/cert/temp_elise.p12 -srcstoretype pkcs12 -destkeystore /tmp/cert/keystores/testelise-jssecacerts -deststorepass $elise_keystore_password -srcstorepass $elise_pk12_password

# get certs for nonprod cpc wildfly trust store
${aws} ssm get-parameter --name "/raman-test/elise-certs/censysactivemqca-pem" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/censysactivemqca.pem
${aws} ssm get-parameter --name "/raman-test/elise-certs/DigiCertCA-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/DigiCertCA.crt
${aws} ssm get-parameter --name "/raman-test/elise-certs/TrustedRoot-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/TrustedRoot.crt
${aws} ssm get-parameter --name "/raman-test/elise-certs/test/quovadisrootca-pem" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/quovadisrootca.pem
${aws} ssm get-parameter --name "/raman-test/elise-certs/test/ua-services03-root-pem" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/ua_services03_root.pem
${aws} ssm get-parameter --name "/raman-test/elise-certs/test/ua-services04-intermediate-pem" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/ua_services04_intermediate.pem

# create nonprod cpc wildfly trust store
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/censysactivemqca.pem -alias censysactivemqca
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/DigiCertCA.crt -alias dvladigicertintermediate 
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/TrustedRoot.crt -alias dvladigicertroot -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/quovadisrootca.pem -alias quovadisrootca -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/ua_services03_root.pem -alias ua_services03_root -noprompt
/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/ua_services04_intermediate.pem -alias ua_services04_intermediate -noprompt

mkdir -p /opt/wildfly/cpc_prop_home/wildfly-cipher/

cp /tmp/cert/keystores/cpc-wildfly-keystore.jks /opt/wildfly/cpc_prop_home/wildfly-cipher/
cp /tmp/cert/keystores/cpc-wildfly-truststore.jks /opt/wildfly/cpc_prop_home/wildfly-cipher/
cp /tmp/cert/keystores/testelise-jssecacerts /opt/wildfly/cpc_prop_home/wildfly-cipher/
chown d90wrapper:d90wrapper /opt/d90wrapper/conf/cpc-wildfly-keystore.jks
chown d90wrapper:d90wrapper /opt/d90wrapper/conf/cpc-wildfly-truststore.jks
chown d90wrapper:d90wrapper /opt/d90wrapper/conf/testelise-jssecacerts
chmod 750 /opt/d90wrapper/conf/cpc-wildfly-keystore.jks
chmod 750 /opt/d90wrapper/conf/cpc-wildfly-truststore.jks
chmod 750 /opt/d90wrapper/conf/testelise-jssecacerts

/opt/cpc-back-config/uat01      /cpc_prop_home/cipher/testelise-jssecacerts
/opt/cpc-back-config/uat01-batch/cpc_prop_home/cipher/testelise-jssecacerts

####################
# keeping just for reference
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# prod elise
# get prod elise cert


# get any additional certs to trust

#${aws} ssm get-parameter --name "/raman-test/elise-certs/quovadisglobal-pem" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/quovadisglobal.pem

# get elise root and intermediate certificates # can be crt or pem
#${aws} ssm get-parameter --name "/raman-test/elise-certs/quovadisintermediate-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/quovadisintermediate.crt
#${aws} ssm get-parameter --name "/raman-test/elise-certs/quovadisroot-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/quovadisroot.crt
#${aws} ssm get-parameter --name "/raman-test/elise-certs/root-crt" --with-decryption --query 'Parameter.Value' --output text > /tmp/cert/root.crt

#convert digicert root and intermediate to pem:
#openssl x509 -in /tmp/cert/TrustedRoot.crt -out /tmp/cert/TrustedRoot.pem -outform PEM
#openssl x509 -in /tmp/cert/DigiCertCA.crt -out /tmp/cert/DigiCertCA.pem -outform PEM

# combine digicert root and intermediate pems to make chain:
#cat /tmp/cert/TrustedRoot.pem /tmp/cert/DigiCertCA.pem > /tmp/cert/ca-chain-bundle.cert.pem

#verify chain (will say self signed):
#verify_chain=$(openssl verify -CAfile /tmp/cert/cpc_dvsa_gov_uk.crt /tmp/cert/ca-chain-bundle.cert.pem)

#convert to pk12:
#(name and password needs to match cpc variables but using a test password for now)
#certKey="testing" # this needs to be got from parameter store and source and destination passwords will be different
# -name and -out filename will vary depending upon aws account
#openssl pkcs12 -export -inkey /tmp/cert/cpc_dvsa_gov_uk_private.key -in /tmp/cert/cpc_dvsa_gov_uk.crt -certfile /tmp/cert/ca-chain-bundle.cert.pem -name prodelise -out /tmp/cert/prod_elise.p12 -passout pass:$elise_pk12_password

#verify pk12 file: this may not be needed
#openssl pkcs12 -info -in /tmp/cert/prod_elise.p12

# create cpc-wildfly-keystore.jks keystore
# add prod elise cert to keystore, dest and source passwords are just test values and should be retrieved from paramstore
#/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importkeystore -srckeystore /tmp/cert/prod_elise.p12 -srcstoretype pkcs12 -destkeystore /tmp/cert/keystores/cpc-wildfly-keystore.jks -deststorepass $cpc_keystore_password -srcstorepass $elise_pk12_password


# create cpc-wildfly-truststore.jks trust store
# add cert aliases to cpc-wildfly-truststore.jks trust store
#------------------------------------------------------------
#censysactivemqca         - 
#dvladigicertintermediate - DigiCertCA.pem 
#dvladigicertroot         - TrustedRoot.pem
#prodelise                - is not needed in cpc-wildfly-truststore.jks
#quovadisrootcatruststore - 
#/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/censysactivemqca.pem -alias censysactivemqca
#/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/DigiCertCA.crt -alias dvladigicertintermediate 
#/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/TrustedRoot.crt -alias dvladigicertroot -noprompt
#/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/cpc-wildfly-truststore.jks -deststorepass $cpc_keystore_password -file /tmp/cert/quovadisglobal.pem -alias quovadisrootcatruststore

# create productionelise-jssecacerts keystore
# add prod elise cert to productionelise-jssecacerts
#/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importkeystore -srckeystore /tmp/cert/prod_elise.p12 -srcstoretype pkcs12 -destkeystore /tmp/cert/keystores/productionelise-jssecacerts -deststorepass $elise_keystore_password -srcstorepass $elise_pk12_password

# productionelise-jssecacerts cert aliases
#cpc.dsa.gsi.gov.uk101019  - expiredn
#prodelise                 - prod_elise.p12
#quovadisintermediate      - quovadisglobal.pem
#quovadisroot
#root                      - TrustedRoot.pem

# add root and intermediate to productionelise-jssecacerts
#/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/productionelise-jssecacerts -deststorepass $elise_keystore_password -alias quovadisintermediate -file /tmp/cert/quovadisintermediate.crt  
#/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/productionelise-jssecacerts -deststorepass $elise_keystore_password -alias quovadisroot -file /tmp/cert/quovadisroot.crt -noprompt
#/usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/bin/keytool -importcert -trustcacerts -keystore /tmp/cert/keystores/productionelise-jssecacerts -deststorepass $elise_keystore_password -alias root -file /tmp/cert/root.crt -noprompt
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



# copy keystore and truststores to the required location

# error trapping example
if [ $${?} -ne 0 ]; then
    error 'Unable to get cpc_dvsa_gov_uk_crt parameter';
  else
    log 'INFO' "Retrieved cpc_dvsa_gov_uk_crt parameter from parameter store";
fi;
