# TARS Public ALB Listener for port 443
resource "aws_alb_listener" "tars-private-443" {
  load_balancer_arn = aws_alb.tars-private-facing.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tars-frontend-private-8443.arn
  }
}

