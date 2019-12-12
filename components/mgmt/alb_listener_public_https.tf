resource "aws_alb_listener" "public_https" {
  load_balancer_arn = aws_alb.public.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.tars_dvsacloud_uk.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.public_default.arn
  }
}

