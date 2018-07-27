resource "aws_autoscaling_schedule" "cpc_back_down" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkins-down"
  )}"

  min_size               = "${var.cpc-back_asg_min_size}"
  max_size               = "${var.cpc-back_asg_max_size}"
  desired_capacity       = "${var.cpc-back_scaledown_desired}"
  recurrence             = "${var.cpc-back_scaledown_recurrence}"
  autoscaling_group_name = "${module.cpc-back.autoscaling_group_id}"
}

resource "aws_autoscaling_schedule" "tars_back_up" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkins-up"
  )}"

  min_size               = "${var.cpc-back_asg_min_size}"
  max_size               = "${var.cpc-back_asg_max_size}"
  desired_capacity       = "${var.cpc-back_scaleup_desired}"
  recurrence             = "${var.cpc-back_scaleup_recurrence}"
  autoscaling_group_name = "${module.cpc-back.autoscaling_group_id}"
}
