resource "aws_alb_listener" "prometheus-private" {
  load_balancer_arn = "${aws_alb.prometheus-private.arn}"
  port              = 9090
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.prometheus-9090.arn}"
  }
}