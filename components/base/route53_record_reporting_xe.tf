resource "aws_route53_record" "reporting_xe" {
  count = var.reporting_xe_count

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  name    = "reporting-xe-${var.environment}-public"
  type    = "A"

  alias {
    evaluate_target_health = true

    name    = aws_alb.reporting_xe_alb[count.index].dns_name
    zone_id = aws_alb.reporting_xe_alb[count.index].zone_id
  }
}


resource "aws_route53_record" "reporting_xe_private" {
  count = var.reporting_xe_count

  name    = "reporting-xe-private"
  zone_id = aws_route53_zone.vpc_private.zone_id
  type    = "A"
  records = aws_network_interface.reporting_xe.*.private_ip
  ttl     = "300"
}


resource "aws_route53_record" "reporting_xe_private_prod" {
  count = var.reporting_xe_count

  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  name    = var.reporting_xe_cert_name
  type    = "A"

  alias {
    evaluate_target_health = true

    name    = aws_alb.reporting_xe_alb[count.index].dns_name
    zone_id = aws_alb.reporting_xe_alb[count.index].zone_id
  }
}
