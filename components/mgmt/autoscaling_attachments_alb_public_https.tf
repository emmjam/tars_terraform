resource "aws_autoscaling_attachment" "public_https_nexus" {
  autoscaling_group_name = "${module.microservice_nexus.autoscaling_group_name}"
  alb_target_group_arn   = "${aws_alb_target_group.nexus.arn}"
}
