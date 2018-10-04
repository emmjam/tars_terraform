resource "aws_autoscaling_schedule" "bastion_down" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "bastion-down"
  )}"

  min_size               = "${var.bastion_asg_min_size}"
  max_size               = "${var.bastion_asg_max_size}"
  desired_capacity       = "${var.bastion_scaledown_desired}"
  recurrence             = "${var.bastion_scaledown_recurrence}"
  autoscaling_group_name = "${module.bastion.autoscaling_group_id}"
}

resource "aws_autoscaling_schedule" "bastion_up" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "bastion-up"
  )}"

  min_size               = "${var.bastion_asg_min_size}"
  max_size               = "${var.bastion_asg_max_size}"
  desired_capacity       = "${var.bastion_scaleup_desired}"
  recurrence             = "${var.bastion_scaleup_recurrence}"
  autoscaling_group_name = "${module.bastion.autoscaling_group_id}"
}
