resource "aws_cloudwatch_metric_alarm" "SFTPPlus-client_failure" {
  alarm_name          = "${local.csi}-sftpplus-client-failure"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "SFTPPlus-clientFailure"
  namespace           = "${local.csi}-SFTPPlus-client"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  actions_enabled     = true
  alarm_description   = "ALARM when a failure message appears in the SFTPPlus-client logs"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  count               = var.sftpplus_alarm_count
}