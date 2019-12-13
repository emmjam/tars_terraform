# R53 record for the TARS mock ALB
resource "aws_route53_record" "tars-mock" {
  name    = "tars-mock"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars-alb-mock-private.dns_name
    zone_id                = aws_alb.tars-alb-mock-private.zone_id
    evaluate_target_health = true
  }
}

