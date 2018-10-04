resource "aws_alb_listener" "prometheus-http-public" {
  load_balancer_arn = "${aws_alb.prometheus-public.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "${data.aws_acm_certificate.prometheus.arn}"
 
  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.prometheus-80.arn}"
  }
}
