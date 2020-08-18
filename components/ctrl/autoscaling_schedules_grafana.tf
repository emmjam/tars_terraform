resource "aws_autoscaling_schedule" "grafana_down" {
  count                  = "${var.account_environment != "mgmt" ? 1 : 0}"
  scheduled_action_name  = "${local.csi}/grafana-down"
  min_size               = var.grafana_asg_min_size
  max_size               = var.grafana_asg_max_size
  desired_capacity       = var.grafana_scaledown_desired
  recurrence             = var.grafana_scaledown_recurrence
  autoscaling_group_name = module.grafana.autoscaling_group_id
}

resource "aws_autoscaling_schedule" "grafana_up" {
  count                  = "${var.account_environment != "mgmt" ? 1 : 0}"
  scheduled_action_name  = "${local.csi}/grafana-up"
  min_size               = var.grafana_asg_min_size
  max_size               = var.grafana_asg_max_size
  desired_capacity       = var.grafana_scaleup_desired
  recurrence             = var.grafana_scaleup_recurrence
  autoscaling_group_name = module.grafana.autoscaling_group_id
}

