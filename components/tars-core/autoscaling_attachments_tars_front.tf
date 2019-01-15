resource "aws_autoscaling_attachment" "tars-frontend-8443" {
  autoscaling_group_name = "${module.tars_front.autoscaling_group_name}"
  alb_target_group_arn   = "${aws_alb_target_group.tars-frontend-8443.arn}"
}

resource "aws_autoscaling_attachment" "tars-frontend-7443" {
  autoscaling_group_name = "${module.tars_front.autoscaling_group_name}"
  alb_target_group_arn   = "${aws_alb_target_group.irdt-frontend-7443.arn}"
}

resource "aws_autoscaling_attachment" "tars-frontend-private-8443" {
  autoscaling_group_name = "${module.tars_front.autoscaling_group_name}"
  alb_target_group_arn   = "${aws_alb_target_group.tars-frontend-private-8443.arn}"
}

resource "aws_autoscaling_attachment" "tars-dvsa-public-8443" {
  autoscaling_group_name = "${module.tars_front.autoscaling_group_name}"
  alb_target_group_arn   = "${aws_alb_target_group.tars-dvsa-public-8443.arn}"
}
