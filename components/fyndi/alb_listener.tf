# TARS Batch ALB Listener for port 8080
resource "aws_alb_listener" "fyndi-f-8080" {
  load_balancer_arn = "${aws_alb.fyndi-f.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = "${data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.fyndi-f-8080.arn}"
  }
}

resource "aws_alb_listener" "fyndi-b-8080" {
  load_balancer_arn = "${aws_alb.fyndi-b.arn}"
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.fyndi-b-8080.arn}"
  }
}
