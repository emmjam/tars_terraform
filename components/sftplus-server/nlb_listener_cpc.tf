resource "aws_lb_listener" "sftpplus-15021" {
  load_balancer_arn = "${aws_lb.sftpplus-svr-public.arn}"
  port              = "15021"
  protocol          = "TCP"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "${data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.sftpplus_svr-15021.arn}"
  }
}
