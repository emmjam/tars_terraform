# R53 record for the TARS mock ALB
resource "aws_route53_record" "tars-mock-sftp" {
  name    = "tars-mock-sftp"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"

  alias {
    name                   = aws_lb.mock-nlb.dns_name
    zone_id                = aws_lb.mock-nlb.zone_id
    evaluate_target_health = true
  }
}

