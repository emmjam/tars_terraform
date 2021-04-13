resource "aws_cloudwatch_metric_alarm" "ibs_unhealthyhost" {
  alarm_name          = "${local.csi}-ibs-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS ibs ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup = aws_alb_target_group.ibs-8080.arn_suffix
    LoadBalancer = aws_alb.apps.arn_suffix
  }
}

resource "aws_cloudwatch_metric_alarm" "obs_unhealthyhost" {
  alarm_name          = "${local.csi}-obs-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS obs ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = aws_alb_target_group.private-obs-8080.arn_suffix
    LoadBalancer = aws_alb.private.arn_suffix
  }
}

resource "aws_cloudwatch_metric_alarm" "fyndi_unhealthyhost" {
  alarm_name          = "${local.csi}-fyndi-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS fyndi ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = aws_alb_target_group.private-fyndi-b-8080.arn_suffix
    LoadBalancer = aws_alb.private.arn_suffix
  }
}