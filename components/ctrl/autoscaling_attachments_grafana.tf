resource "aws_autoscaling_attachment" "grafana-80" {
  count                  = var.account_environment != "mgmt" ? 1 : 0
  autoscaling_group_name = module.grafana.autoscaling_group_name
  lb_target_group_arn   = aws_alb_target_group.grafana-80[count.index].id
}

