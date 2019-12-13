# TODO: peacheym: ixenco?
resource "aws_route53_record" "ixenco" {
  name    = "tars-xenco-lb"
  zone_id = data.terraform_remote_state.base.outputs.private_zone_id
  type    = "A"

  alias {
    name                   = aws_lb.xenco.dns_name
    zone_id                = aws_lb.xenco.zone_id
    evaluate_target_health = true
  }
}

