# TARS Batch ALB Listener for port 8080
resource "aws_alb_listener" "obs-8080" {
  load_balancer_arn = "${aws_alb.obs.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.obs-8080.arn}"
  }
}
