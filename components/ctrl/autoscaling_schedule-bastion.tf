resource "aws_autoscaling_schedule" "bastion_down" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "bastion-down"
  )}"

  min_size               = "${lookup(var.bastion,"asg_min_size")}"
  max_size               = "${lookup(var.bastion,"asg_max_size")}"
  desired_capacity       = "${lookup(var.bastion,"scaledown_desired")}"
  recurrence             = "${lookup(var.bastion,"scaledown_recurrence")}"
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

  min_size               = "${lookup(var.bastion,"asg_min_size")}"
  max_size               = "${lookup(var.bastion,"asg_max_size")}"
  desired_capacity       = "${lookup(var.bastion,"scaleup_desired")}"
  recurrence             = "${lookup(var.bastion,"scaleup_recurrence")}"
  autoscaling_group_name = "${module.bastion.autoscaling_group_id}"
}
