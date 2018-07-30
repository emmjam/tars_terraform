
resource "aws_lb_target_group" "sftpplus_svr-15021" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "15021"
  )}"
  port     = "15021"
  protocol = "TCP"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

}

resource "aws_autoscaling_attachment" "sftpplus_svr-15021" {
  autoscaling_group_name = "${module.sftpplus_svr.autoscaling_group_id}"
  alb_target_group_arn   = "${aws_lb_target_group.sftpplus_svr-15021.arn}"
}

