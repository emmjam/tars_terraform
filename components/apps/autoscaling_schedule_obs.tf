resource "aws_autoscaling_schedule" "obs_down" {
  count                  = "${var.aws_autoscaling_enabled}"
  scheduled_action_name  = "${local.csi}/obs-down"
  min_size               = "${var.obs_asg_min_size}"
  max_size               = "${var.obs_asg_max_size}"
  desired_capacity       = "${var.obs_scaledown_desired}"
  recurrence             = "${var.obs_scaledown_recurrence}"
  autoscaling_group_name = "${module.obs.autoscaling_group_id}"
}

resource "aws_autoscaling_schedule" "obs_up" {
  count                  = "${var.aws_autoscaling_enabled}"
  scheduled_action_name  = "${local.csi}/obs-up"
  min_size               = "${var.obs_asg_min_size}"
  max_size               = "${var.obs_asg_max_size}"
  desired_capacity       = "${var.obs_scaleup_desired}"
  recurrence             = "${var.obs_scaleup_recurrence}"
  autoscaling_group_name = "${module.obs.autoscaling_group_id}"
}
