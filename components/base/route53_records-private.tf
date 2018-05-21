# R53 record for the AWS MQ endpoint

resource "aws_route53_record" "awsmq" {
  name = "${format(
    "%s-%s",
    var.project,
    "awsmq"
  )}"
  zone_id = "${aws_route53_zone.vpc.zone_id}"
  type    = "CNAME"
  ttl     = 60

  # aws_mq_broker doesn't provide a direct endpoint that's ready to be used by R53
  # aws_mq_broker.tars-awsmq.instances.0.endpoints.0 should provide something like ssl://b-4e6a583f-ccc8-4e6e-a873-f365df685ddb-1.mq.eu-west-1.amazonaws.com:61617
  # So strip off the first 6 and last 6 characters (well 6 + 6) to give
  # b-4e6a583f-ccc8-4e6e-a873-f365df685ddb-1.mq.eu-west-1.amazonaws.com
  records = [ "${substr(aws_mq_broker.tars-awsmq.instances.0.endpoints.0, 6, length(aws_mq_broker.tars-awsmq.instances.0.endpoints.0) - 12) }" ]
}
