# Create the R53 record for the public ALB
resource "aws_route53_record" "ibs-front" {
  name = format("%s-%s-%s", "ibs", var.environment, "public")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.apps.dns_name
    zone_id                = aws_alb.apps.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "ibs-front_private" {
  name    = format("%s-%s-%s", "ibs", var.environment, "public")
  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  type    = "A"

  alias {
    name                   = aws_alb.apps.dns_name
    zone_id                = aws_alb.apps.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "incapsula-ibs-frontend" {
  count   = var.environment == "uat02" ? 1 : 0
  name    = format("%s-%s-%s", "incapsula-ibs", var.environment, "public")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "CNAME"

  ttl = 300

  records = ["p9vg8tj.x.incapdns.net"]
 
}

