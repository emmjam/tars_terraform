# TARS Public ALB Listener for port 443
resource "aws_alb_listener" "tars-public-443" {
  load_balancer_arn = "${aws_alb.tars-public-facing.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = "${data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.tars-frontend-8443.arn}"
  }
}

resource "aws_lb_listener_rule" "host_based_routing" {
  listener_arn = "${aws_alb_listener.tars-public-443.arn}"
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.irdt-frontend-7443.arn}"
  }

  condition {
    field  = "host-header"
    values = ["${aws_route53_record.irdt-public.fqdn}"]
  }
}

# TARS Public ALB Listener for port 9990 - Wildfly Admin Console
# Not needed long term
resource "aws_alb_listener" "tars-public-9990" {
  load_balancer_arn = "${aws_alb.tars-public-facing.arn}"
  port              = "9990"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "${data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.tars-frontend-9990.arn}"
  }
}
