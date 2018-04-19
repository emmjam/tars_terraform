# Create the config for the AWS MQ Broker
# Define all the TARS msg queue's required

resource "aws_mq_configuration" "tars-awsmq" {
  description    = "${lookup(var.aws_mq_config,"description")}"
  name           = "${lookup(var.aws_mq_config,"name")}"
  engine_type    = "${lookup(var.aws_mq_config,"engine_type")}"
  engine_version = "${lookup(var.aws_mq_config,"engine_version")}"
  data           = <<DATA
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<broker xmlns="http://activemq.apache.org/schema/core">
  <plugins>
    <forcePersistencyModeBrokerPlugin persistenceFlag="true"/>
    <statisticsBrokerPlugin/>
    <timeStampingBrokerPlugin ttlCeiling="86400000" zeroExpirationOverride="86400000"/>
    <authorizationPlugin>
      <map>
          <authorizationMap>
            <authorizationEntries>
                <authorizationEntry admin="admins,activemq-webconsole" read="admins,users,activemq-webconsole" write="admins,activemq-webconsole" queue=">"/>
            </authorizationEntries>
          </authorizationMap>
      </map>
    </authorizationPlugin> 
  </plugins>
  <destinations>
    <queue physicalName="ExpiryQueue" />
    <queue physicalName="DLQ" />
    <queue physicalName="JobQueue" />
    <queue physicalName="JobErrorQueue" />
   </destinations>
</broker>
DATA
}