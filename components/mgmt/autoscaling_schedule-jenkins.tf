resource "aws_autoscaling_schedule" "jenkins_down" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkins-down"
  )}"

  min_size               = "${var.jenkins_asg_min_size}"
  max_size               = "${var.jenkins_asg_max_size}"
  desired_capacity       = "${var.jenkins_scaledown_desired}"
  recurrence             = "${var.jenkins_scaledown_recurrence}"
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

  min_size               = "${var.jenkins_asg_min_size}"
  max_size               = "${var.jenkins_asg_max_size}"
  desired_capacity       = "${var.jenkins_scaleup_desired}"
  recurrence             = "${var.jenkins_scaleup_recurrence}"
  autoscaling_group_name = "${module.jenkins.jenkins_blue_asg_id}"
}
