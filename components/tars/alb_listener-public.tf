resource "aws_alb_listener" "tars-public-8080" {
  load_balancer_arn = "${aws_alb.tars-public-facing.arn}"
  port              = "8080"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "${data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.tars-frontend-8080.arn}"
  }
}

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
