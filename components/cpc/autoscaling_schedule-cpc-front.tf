resource "aws_autoscaling_schedule" "cpc_front_down" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkins-down"
  )}"

  min_size               = "${var.cpc-front_asg_min_size}"
  max_size               = "${var.cpc-front_asg_max_size}"
  desired_capacity       = "${var.cpc-front_scaledown_desired}"
  recurrence             = "${var.cpc-front_scaledown_recurrence}"
  autoscaling_group_name = "${module.cpc-front.autoscaling_group_id}"
}

resource "aws_autoscaling_schedule" "tars_front_up" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkins-up"
  )}"

  min_size               = "${var.cpc-front_asg_min_size}"
  max_size               = "${var.cpc-front_asg_max_size}"
  desired_capacity       = "${var.cpc-front_scaleup_desired}"
  recurrence             = "${var.cpc-front_scaleup_recurrence}"
  autoscaling_group_name = "${module.cpc-front.autoscaling_group_id}"
}
