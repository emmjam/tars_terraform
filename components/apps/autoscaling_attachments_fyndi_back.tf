resource "aws_autoscaling_attachment" "fyndi-b-8080" {
  autoscaling_group_name = "${module.fyndi-b.autoscaling_group_name}"
  alb_target_group_arn   = "${aws_alb_target_group.fyndi-b-8080.id}"
}
