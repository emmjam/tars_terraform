resource "aws_cloudwatch_metric_alarm" "cpc_front_unhealthyhost" {
  alarm_name          = "${local.csi}-cpc-front-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS cpc front ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = aws_alb_target_group.cpc-front-dvsa-8443.arn_suffix
    LoadBalancer = aws_alb.cpc-front-dvsa.arn_suffix
  }
}

resource "aws_cloudwatch_metric_alarm" "cpc_back_unhealthyhost" {
  alarm_name          = "${local.csi}-cpc-back-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS cpc back ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = aws_alb_target_group.cpc-back-8080.arn_suffix
    LoadBalancer = aws_alb.cpc-back.arn_suffix
  }
}


resource "aws_cloudwatch_metric_alarm" "cpc_front_dvsa_unhealthyhost" {
  alarm_name          = "${local.csi}-cpc-front-dvsa-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS cpc front dvsa ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = aws_alb_target_group.cpc-front-dvsa-internet-8443.arn_suffix
    LoadBalancer = aws_alb.cpc-front-dvsa-internet.arn_suffix
  }
}

resource "aws_cloudwatch_metric_alarm" "cpc_front_internal_unhealthyhost" {
  alarm_name          = "${local.csi}-cpc-front-internal-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS cpc front internal ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = aws_alb_target_group.cpc-front-internal-9443.arn_suffix
    LoadBalancer = aws_alb.cpc-front-internal.arn_suffix
  }
}

resource "aws_cloudwatch_metric_alarm" "cpc_batch_unhealthyhost" {
  alarm_name          = "${local.csi}-cpc-batch-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/Auto Scaling"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy host in the TARS cpc batch ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    AutoScalingGroupName = module.cpc_batch.autoscaling_group_name
  }
}