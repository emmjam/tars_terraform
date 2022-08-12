# TARS Public DVSA ALB Listener for port 443
resource "aws_alb_listener" "tars_drv_svc_443" {
  count = var.drv_svc_enabled ? 1 : 0

  load_balancer_arn = aws_alb.tars_alb_drv_svc[0].arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = data.aws_acm_certificate.driver_services_cert[0].arn

  default_action {
    type        = "redirect"
    redirect {
      status_code = "HTTP_301"
      host        = "drivers-services.dvsa.gov.uk"
    } 
  }
}
