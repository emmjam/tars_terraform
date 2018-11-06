resource "aws_route53_record" "dft" {
  name    = "dft"
  zone_id = "${aws_route53_zone.public_domain.id}"
  type    = "A"
  ttl     = "60"
  records = [ "82.203.36.40" ]

}

