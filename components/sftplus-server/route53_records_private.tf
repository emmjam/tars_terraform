# Create the R53 record for the Internal ALB
resource "aws_route53_record" "sftpplus_svr" {
  name    = "sftpplus-private"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"

  alias {
    name                   = aws_lb.sftpplus-svr-private.dns_name
    zone_id                = aws_lb.sftpplus-svr-private.zone_id
    evaluate_target_health = true
  }
}

