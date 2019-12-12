resource "aws_autoscaling_attachment" "grafana-80" {
  autoscaling_group_name = module.grafana.autoscaling_group_name
  alb_target_group_arn   = aws_alb_target_group.grafana-80.id
}

