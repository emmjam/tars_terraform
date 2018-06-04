resource "aws_autoscaling_schedule" "tars_front_down" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkins-down"
  )}"

  min_size               = "${var.wildfly-front_asg_min_size}"
  max_size               = "${var.wildfly-front_asg_max_size}"
  desired_capacity       = "${var.wildfly-front_scaledown_desired}"
  recurrence             = "${var.wildfly-front_scaledown_recurrence}"
  autoscaling_group_name = "${aws_autoscaling_group.tars-frontend.id}"
}

resource "aws_autoscaling_schedule" "tars_front_up" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkins-up"
  )}"

  min_size               = "${var.wildfly-front_asg_min_size}"
  max_size               = "${var.wildfly-front_asg_max_size}"
  desired_capacity       = "${var.wildfly-front_scaleup_desired}"
  recurrence             = "${var.wildfly-front_scaleup_recurrence}"
  autoscaling_group_name = "${aws_autoscaling_group.tars-frontend.id}"
}

