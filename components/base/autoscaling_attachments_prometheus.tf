resource "aws_autoscaling_attachment" "prometheus-9090" {
  autoscaling_group_name = "${module.prometheus.autoscaling_group_name}"
  alb_target_group_arn   = "${aws_alb_target_group.prometheus-9090.id}"
}
