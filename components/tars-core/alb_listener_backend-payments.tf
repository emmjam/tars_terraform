resource "aws_alb_listener" "tars-private-payments-443" {
  load_balancer_arn = aws_alb.tars-alb-backend-payments.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = data.aws_acm_certificate.payments_nonprod_tars_dvsacloud_uk.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tars-backend-payments-8080.arn
  }
}

