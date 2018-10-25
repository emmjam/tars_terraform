resource "aws_route53_record" "dft" {
  name    = "dft"
  zone_id = "${aws_route53_zone.public_domain.id}"
  type    = "A"
  ttl     = "60"
  records = [ "82.203.36.40" ]

}

resource "aws_route53_record" "driverpracticaltest" {
  name    = "driverpracticaltest"
  zone_id = "${aws_route53_zone.public_domain.id}"
  type    = "A"
  ttl     = "60"
  records = [ "45.60.65.113", "45.60.72.113" ]
}

resource "aws_route53_record" "finddrivinginstructor" {
  name    = "finddrivinginstructor"
  zone_id = "${aws_route53_zone.public_domain.id}"
  type    = "A"
  ttl     = "60"
  records = [ "82.203.36.43" ]
}

