resource "aws_cloudwatch_metric_alarm" "sftpplus_unhealthyhost" {
  alarm_name          = "${local.csi}-sftpplus-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS sftpplus ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = aws_lb_target_group.sftpplus_svr-10022-pub.arn_suffix
    LoadBalancer = aws_lb.sftpplus-svr-public.arn_suffix
  }
}

resource "aws_cloudwatch_metric_alarm" "cpc_sftpplus_unhealthyhost" {
  alarm_name          = "${local.csi}-cpc_sftpplus-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS cpc sftpplus ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = aws_lb_target_group.sftpplus_svr-10022.arn_suffix
    LoadBalancer = aws_lb.sftpplus-svr-private.arn_suffix
  }
}
