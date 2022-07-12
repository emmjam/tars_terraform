resource "aws_alb_listener" "reporting_xe_8443" {
  count = var.reporting_xe_count

  load_balancer_arn = aws_alb.reporting_xe_alb.0.arn

  port            = "8443"
  protocol        = "HTTPS"
  ssl_policy      = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn = var.environment == "prod" ? data.aws_acm_certificate.reporting_xe_cert[0].arn : data.aws_acm_certificate.tars_dvsacloud_uk.arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Page not found"
      status_code  = "404"
    }
  }
}
