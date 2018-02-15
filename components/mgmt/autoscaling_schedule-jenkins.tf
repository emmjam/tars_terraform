resource "aws_autoscaling_schedule" "jenkins_down" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkins-down"
  )}"

  min_size               = "${lookup(var.jenkins,"asg_min_size")}"
  max_size               = "${lookup(var.jenkins,"asg_max_size")}"
  desired_capacity       = "${lookup(var.jenkins,"scaledown_desired")}"
  recurrence             = "${lookup(var.jenkins,"scaledown_recurrence")}"
  autoscaling_group_name = "${module.jenkins.jenkins_blue_asg_id}"
}

resource "aws_autoscaling_schedule" "jenkins_up" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkins-up"
  )}"

  min_size               = "${lookup(var.jenkins,"asg_min_size")}"
  max_size               = "${lookup(var.jenkins,"asg_max_size")}"
  desired_capacity       = "${lookup(var.jenkins,"scaleup_desired")}"
  recurrence             = "${lookup(var.jenkins,"scaleup_recurrence")}"
  autoscaling_group_name = "${module.jenkins.jenkins_blue_asg_id}"
}
