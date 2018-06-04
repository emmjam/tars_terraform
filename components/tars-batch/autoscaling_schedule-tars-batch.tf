resource "aws_autoscaling_schedule" "tars_batch_down" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkins-down"
  )}"

  min_size               = "${var.wildfly-batch_asg_min_size}"
  max_size               = "${var.wildfly-batch_asg_max_size}"
  desired_capacity       = "${var.wildfly-batch_scaledown_desired}"
  recurrence             = "${var.wildfly-batch_scaledown_recurrence}"
  autoscaling_group_name = "${aws_autoscaling_group.tars-batch.id}"
}

resource "aws_autoscaling_schedule" "tars_batch_up" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkins-up"
  )}"

  min_size               = "${var.wildfly-batch_asg_min_size}"
  max_size               = "${var.wildfly-batch_asg_max_size}"
  desired_capacity       = "${var.wildfly-batch_scaleup_desired}"
  recurrence             = "${var.wildfly-batch_scaleup_recurrence}"
  autoscaling_group_name = "${aws_autoscaling_group.tars-batch.id}"
}

