resource "aws_lb_listener_certificate" "ibs" {
  listener_arn    = "${aws_alb_listener.apps-8080.arn}"
  certificate_arn = "${data.aws_acm_certificate.ibs_tars_dvsacloud_uk.arn}"
}