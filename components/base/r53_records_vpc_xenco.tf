resource "aws_route53_record" "xenco" {
  zone_id = aws_route53_zone.vpc.zone_id
  name    = "xenco"
  type    = "A"
  ttl     = "30"

  ## Xenco IP
  records = [
    "188.94.128.15",
  ]
}

