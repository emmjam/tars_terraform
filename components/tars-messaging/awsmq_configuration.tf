# Create the config for the AWS MQ Broker
# Define all the TARS msg queue's required

resource "aws_mq_configuration" "tars-awsmq" {
  description    = "${var.aws_mq_config_description}"
  name           = "${var.aws_mq_config_name}"
  engine_type    = "${var.aws_mq_config_engine_type}"
  engine_version = "${var.aws_mq_config_engine_version}"
  data           = <<DATA
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<broker xmlns="http://activemq.apache.org/schema/core">
  <plugins>
    <forcePersistencyModeBrokerPlugin persistenceFlag="true"/>
    <statisticsBrokerPlugin/>
    <timeStampingBrokerPlugin ttlCeiling="86400000" zeroExpirationOverride="86400000"/>
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
