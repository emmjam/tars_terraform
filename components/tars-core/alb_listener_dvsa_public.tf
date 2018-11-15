# TARS Public DVSA ALB Listener for port 443
resource "aws_alb_listener" "tars-dvsa-public-443" {
  load_balancer_arn = "${aws_alb.tars-dvsa-public.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = "${data.aws_acm_certificate.tars_dvsacloud_uk.arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.tars-dvsa-public-8443.arn}"
  }
}