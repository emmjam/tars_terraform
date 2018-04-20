################################################################################
#
# Route 53 entry
#
################################################################################

#### IMPORTANT
#### This route 53 record is a bit of a hack. It's to support the traditional
#### proxy setup required due to issues with SNI from nodes that don't have a
#### python that's 2.7 or later.

resource "aws_route53_record" "squid" {
  zone_id = "${var.zone_id}"
  name    = "squid"
  type    = "A"
  ttl     = "60"

  records = [
    "${aws_instance.squidnat.*.private_ip}",
  ]
}
