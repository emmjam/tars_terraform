resource "aws_cloudwatch_metric_alarm" "SFTPPlus-client_failure" {
  alarm_name          = "${local.csi}-sftpplus-client-failure"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "SFTPPlus-clientFailure"
  namespace           = "${local.csi}-SFTPPlus-client"
  period              = "60"
  statistic           = "Average"
  threshold           = "1"
  actions_enabled     = var.sftpplus_alarm_actions_enabled
  alarm_description   = "ALARM when a failure message appears in the SFTPPlus-client logs"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
}