resource "aws_cloudwatch_metric_alarm" "SFTPPlus-client_failure" {
  alarm_name          = "${local.csi}-sftpplus-client-failure"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "SFTPPlus-clientFailure"
  namespace           = "${local.csi}-SFTPPlus-client"
  period              = "60"
  statistic           = "Sum"
  threshold           = var.sftpplus_threshold
  actions_enabled     = var.sftpplus_alarm_actions_enabled
  alarm_description   = "ALARM when a failure message appears in the SFTPPlus-client logs"
  alarm_actions       = var.sftpplus_alarm_actions
}