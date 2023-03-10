resource "aws_cloudwatch_metric_alarm" "front_unhealthyhost" {
  alarm_name          = "${local.csi}-front-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS front ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = aws_alb_target_group.tars-dvsa-public-8443.arn_suffix
    LoadBalancer = aws_alb.tars-dvsa-public.arn_suffix
  }
}

resource "aws_cloudwatch_metric_alarm" "apache_unhealthyhost" {
  alarm_name          = "${local.csi}-apache-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS apache ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = aws_alb_target_group.apache-80.arn_suffix
    LoadBalancer = aws_alb.apache_public.arn_suffix
  }
}

