resource "aws_alb_listener" "private_https" {
  load_balancer_arn = aws_alb.private.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.mgmt_mgmt_tars_dvsa_aws.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.private_default.arn
  }
}

