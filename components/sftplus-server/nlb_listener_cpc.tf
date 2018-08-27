resource "aws_lb_listener" "sftpplus-15021" {
  load_balancer_arn = "${aws_lb.sftpplus-svr-public.arn}"
  port              = "15021"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.sftpplus_svr-15021.arn}"
  }
}
