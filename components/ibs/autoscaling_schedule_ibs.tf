resource "aws_autoscaling_schedule" "ibs_down" {
  scheduled_action_name  = "${local.csi}/ibs-down"
  min_size               = "${var.ibs_asg_min_size}"
  max_size               = "${var.ibs_asg_max_size}"
  desired_capacity       = "${var.ibs_scaledown_desired}"
  recurrence             = "${var.ibs_scaledown_recurrence}"
  autoscaling_group_name = "${module.ibs.autoscaling_group_id}"
}

resource "aws_autoscaling_schedule" "ibs_up" {
  scheduled_action_name  = "${local.csi}/ibs-up"
  min_size               = "${var.ibs_asg_min_size}"
  max_size               = "${var.ibs_asg_max_size}"
  desired_capacity       = "${var.ibs_scaleup_desired}"
  recurrence             = "${var.ibs_scaleup_recurrence}"
  autoscaling_group_name = "${module.ibs.autoscaling_group_id}"
}
