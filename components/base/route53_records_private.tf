# R53 record for the AWS MQ endpoint
resource "aws_route53_record" "awsmq" {
  count = "${var.aws_mq_deployment_mode == "SINGLE_INSTANCE" ? 1 : 2 }"

  name = "${format(
    "%s-%s-%s",
    var.project,
    "awsmq",
    "${count.index + 1}"
  )}"

  zone_id = "${aws_route53_zone.vpc.zone_id}"
  type    = "CNAME"
  ttl     = 60

  # Terraform's support for list and map data handling pre 0.12.* 
  # is terrible. We manually construct the DNS entry required until
  # we can either upgrade to 0.12 for better splat/lookup support
  # or we decide it's safe to use the IPs provided by aws_mq_broker
  records = [
    "${format(
      "%s-%d.mq.%s.amazonaws.com",
      aws_mq_broker.tars-awsmq.id,
      count.index + 1,
      var.aws_region
    )}"
  ]
}