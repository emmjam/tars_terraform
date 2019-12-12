resource "aws_route53_record" "dft" {
  name    = "dft"
  zone_id = aws_route53_zone.public_domain[0].id
  type    = "CNAME"
  ttl     = "60"
  records = ["etydiih.x.incapdns.net"]
}

