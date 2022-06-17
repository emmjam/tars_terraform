resource "aws_alb_listener" "apache-https-public" {
  load_balancer_arn = aws_alb.apache_public.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.apache.arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Page not found."
      status_code  = "404"
    }
  }
}

