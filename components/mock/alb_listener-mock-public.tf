# TARS Mock ALB Listener for port 8443
resource "aws_alb_listener" "tars-mock-8443" {
  load_balancer_arn = "${aws_alb.tars-alb-mock-public.arn}"
  port              = "8443"
  protocol          = "HTTPS"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.tars-mock-8443.arn}"
  }
}
