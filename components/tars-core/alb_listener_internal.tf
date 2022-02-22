#Internal ALB only serves IRDT for Apache routing
resource "aws_alb_listener" "tars-internal-80" {
  load_balancer_arn = aws_alb.tars-internal.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.irdt-frontend-7443.arn
  }
}

resource "aws_alb_listener" "tars-internal-443" {
  load_balancer_arn = aws_alb.tars-internal.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = data.aws_acm_certificate.tars-core-private_tars_dvsa_aws.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.irdt-frontend-7443.arn
  }
}
