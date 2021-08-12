# Create the R53 record for the public ALB
resource "aws_route53_record" "fyndi" {
  name = format("%s-%s-%s", "fyndi", var.environment, "public")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.apps.dns_name
    zone_id                = aws_alb.apps.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "fyndi_priv" {
  name    = format("%s-%s-%s", "fyndi", var.environment, "public")
  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.apps.dns_name
    zone_id                = data.terraform_remote_state.ctrl.outputs.private_r53_zone
    evaluate_target_health = true
  }
}

