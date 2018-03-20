resource "aws_alb_listener" "tars-batch-8080" {
  load_balancer_arn = "${aws_alb.tars-alb-batch-private.arn}"
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.tars-batch-8080.arn}"
  }
}
