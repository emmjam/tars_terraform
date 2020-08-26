resource "aws_cloudwatch_metric_alarm" "tars_back_cpuutilization" {
  count                = var.tars_core_cpuutilization_cw_metric_alarm_enabled ? 1 : 0
  alarm_name           = "${local.csi}-tars-core-cpuutilization-alarm"
  comparison_operator  = "GreaterThanOrEqualToThreshold"
  evaluation_periods   = "5"
  metric_name          = "CPUUtilization"
  namespace            = "AWS/AutoScaling"
  treat_missing_data   = "notBreaching"
  period               = "60"
  statistic            = "Average"
  threshold            = "50"
  unit                 = "Percent"
  alarm_description    = "Alarm when the Average tars-core CPU Utilization exceeds 50% for a period of 1 minutes."
  actions_enabled      = var.tars_core_cpuutilization_cw_metric_alarm_action_enabled
  alarm_actions        = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
}
