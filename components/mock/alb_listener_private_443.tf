resource "aws_alb_listener" "tars_mock_private_443" {
  load_balancer_arn = aws_alb.tars-alb-mock-private.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn

  default_action {
    type             = "forward"
    target_group_arn = module.mock_fargate.lb_target_group_gov_gateway_private
  }
}

