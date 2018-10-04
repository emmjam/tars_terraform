resource "aws_autoscaling_schedule" "grafana_down" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "grafana-down"
  )}"

  min_size               = "${var.grafana_asg_min_size}"
  max_size               = "${var.grafana_asg_max_size}"
  desired_capacity       = "${var.grafana_scaledown_desired}"
  recurrence             = "${var.grafana_scaledown_recurrence}"
  autoscaling_group_name = "${module.grafana.autoscaling_group_id}"
}

resource "aws_autoscaling_schedule" "grafana_up" {
  scheduled_action_name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "grafana-up"
  )}"

  min_size               = "${var.grafana_asg_min_size}"
  max_size               = "${var.grafana_asg_max_size}"
  desired_capacity       = "${var.grafana_scaleup_desired}"
  recurrence             = "${var.grafana_scaleup_recurrence}"
  autoscaling_group_name = "${module.grafana.autoscaling_group_id}"
}
