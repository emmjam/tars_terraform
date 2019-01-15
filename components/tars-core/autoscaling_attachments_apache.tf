resource "aws_autoscaling_attachment" "apache-80" {
  autoscaling_group_name = "${module.apache.autoscaling_group_name}"
  alb_target_group_arn   = "${aws_alb_target_group.apache-80.arn}"
}
