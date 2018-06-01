# TARS Batch AB target group for port 8080
resource "aws_alb_target_group" "ibs-8080" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "8080"
  )}"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    path                = "/"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }

}

resource "aws_autoscaling_attachment" "ibs" {
  autoscaling_group_name = "${module.ibs.autoscaling_group_id}"
  alb_target_group_arn   = "${aws_alb_target_group.ibs-8080.arn}"
}

