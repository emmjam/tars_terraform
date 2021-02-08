resource "aws_lb_listener_rule" "bobj" {
  listener_arn = data.terraform_remote_state.cpc.outputs.cpc_dvsa_internet_listener_arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.bobj-8080.arn
  }

  condition {
    host_header {
      values = ["bobj-${var.environment}.${data.terraform_remote_state.acc.outputs.public_domain_name}"]
    }
  }
}

resource "aws_lb_listener_certificate" "bobj" {
  listener_arn    = data.terraform_remote_state.cpc.outputs.cpc_dvsa_internet_listener_arn
  certificate_arn = data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn
}
