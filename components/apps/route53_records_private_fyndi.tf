# Create the R53 record for the FYNDI Backend ALB
resource "aws_route53_record" "fyndi-backend" {
  name    = "fyndi-backend"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.private.dns_name
    zone_id                = aws_alb.private.zone_id
    evaluate_target_health = true
  }
}

