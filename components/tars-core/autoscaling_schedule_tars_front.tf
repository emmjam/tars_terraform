resource "aws_autoscaling_schedule" "tars_front_down" {
  scheduled_action_name  = "${local.csi}/jenkins-down"
  min_size               = "${var.wildfly-front_asg_min_size}"
  max_size               = "${var.wildfly-front_asg_max_size}"
  desired_capacity       = "${var.wildfly-front_scaledown_desired}"
  recurrence             = "${var.wildfly-front_scaledown_recurrence}"
  autoscaling_group_name = "${module.tars_front.autoscaling_group_id}"
}

resource "aws_autoscaling_schedule" "tars_front_up" {
  scheduled_action_name  = "${local.csi}/jenkins-up"
  min_size               = "${var.wildfly-front_asg_min_size}"
  max_size               = "${var.wildfly-front_asg_max_size}"
  desired_capacity       = "${var.wildfly-front_scaleup_desired}"
  recurrence             = "${var.wildfly-front_scaleup_recurrence}"
  autoscaling_group_name = "${module.tars_front.autoscaling_group_id}"
}

