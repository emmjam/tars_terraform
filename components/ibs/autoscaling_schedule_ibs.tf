resource "aws_autoscaling_schedule" "ibs_down" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "ibs-down"
  )}"

  min_size               = "${var.ibs_asg_min_size}"
  max_size               = "${var.ibs_asg_max_size}"
  desired_capacity       = "${var.ibs_scaledown_desired}"
  recurrence             = "${var.ibs_scaledown_recurrence}"
  autoscaling_group_name = "${module.ibs.autoscaling_group_id}"
}

resource "aws_autoscaling_schedule" "ibs_up" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "ibs-up"
  )}"

  min_size               = "${var.ibs_asg_min_size}"
  max_size               = "${var.ibs_asg_max_size}"
  desired_capacity       = "${var.ibs_scaleup_desired}"
  recurrence             = "${var.ibs_scaleup_recurrence}"
  autoscaling_group_name = "${module.ibs.autoscaling_group_id}"
}

