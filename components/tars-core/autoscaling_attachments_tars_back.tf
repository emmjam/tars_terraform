resource "aws_autoscaling_attachment" "tars-backend-8080" {
  autoscaling_group_name = "${module.tars_back.autoscaling_group_name}"
  alb_target_group_arn   = "${aws_alb_target_group.tars-backend-8080.arn}"
}
