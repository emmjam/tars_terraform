# ALB Listener for port 8080
resource "aws_alb_listener" "cpc-front-8080" {
  load_balancer_arn = "${aws_alb.cpc-front.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "${data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.cpc-front-8080.arn}"
  }
}
