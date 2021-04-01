# TARS backend ALB API Listener for port 8443
resource "aws_alb_listener" "tars-private-api-8443" {
  load_balancer_arn = aws_alb.tars-alb-backend-api.arn
  port              = "8443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = data.aws_acm_certificate.tars-core-private_tars_dvsa_aws.arn

  default_action {
    type = "fixed-response"

    ##### need Health check exception
    fixed_response {
      content_type = "text/plain"
      message_body = "404 Not Found"
      status_code  = "404"
    }
  }
}

