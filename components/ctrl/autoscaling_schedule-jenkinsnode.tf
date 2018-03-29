resource "aws_autoscaling_schedule" "jenkinsnode_down" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkinsnode-down"
  )}"

  min_size               = "${lookup(var.ctrl_jenkinsnode,"asg_min_size")}"
  max_size               = "${lookup(var.ctrl_jenkinsnode,"asg_max_size")}"
  desired_capacity       = "${lookup(var.ctrl_jenkinsnode,"scaledown_desired")}"
  recurrence             = "${lookup(var.ctrl_jenkinsnode,"scaledown_recurrence")}"
  autoscaling_group_name = "${module.jenkinsnode.autoscaling_group_id}"
}

resource "aws_autoscaling_schedule" "jenkinsnode_up" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkinsnode-up"
  )}"

  min_size               = "${lookup(var.ctrl_jenkinsnode,"asg_min_size")}"
  max_size               = "${lookup(var.ctrl_jenkinsnode,"asg_max_size")}"
  desired_capacity       = "${lookup(var.ctrl_jenkinsnode,"scaleup_desired")}"
  recurrence             = "${lookup(var.ctrl_jenkinsnode,"scaleup_recurrence")}"
  autoscaling_group_name = "${module.jenkinsnode.autoscaling_group_id}"
}
