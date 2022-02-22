resource "aws_alb_listener" "apache-https-public" {
  load_balancer_arn = aws_alb.apache_public.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.apache.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.irdt-frontend-7443.arn
  }
}

