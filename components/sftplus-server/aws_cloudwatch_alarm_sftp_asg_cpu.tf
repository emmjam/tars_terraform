resource "aws_cloudwatch_metric_alarm" "sftp_cpuutilization" {
  count               = var.sftp_cpuutilization_cw_metric_alarm_enabled ? 1 : 0
  alarm_name          = "${local.csi}-sftp-cpuutilization-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/AutoScaling"
  treat_missing_data  = "notBreaching"
  period              = "60"
  statistic           = "Average"
  threshold           = "10"
  unit                = "Percent"
  alarm_description   = "Alarm when the Average SFTP CPU Utilization exceeds 10% for a period of 5 minutes."
  actions_enabled     = var.sftp_cpuutilization_cw_metric_alarm_action_enabled
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
}
