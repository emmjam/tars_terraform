resource "aws_cloudwatch_metric_alarm" "squidnat_0_unhealthyhost" {
  alarm_name          = "${local.csi}-squidnat-0-unhealthy-host"

  count               = var.squidnat_unhealthy_host_alarm_count
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/Auto Scaling"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy host in the TARS squidnat_0 ASG"
  alarm_actions       = var.squidnat_cw_alarm_failure_actions

  treat_missing_data  = "notBreaching"

  dimensions = {
    AutoScalingGroupName = module.microservice_squidnat_0.autoscaling_group_name
  }
}

resource "aws_cloudwatch_metric_alarm" "squidnat_1_unhealthyhost" {
  alarm_name          = "${local.csi}-squidnat-1-unhealthy-host"

  count               = var.squidnat_unhealthy_host_alarm_count
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/Auto Scaling"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy host in the TARS squidnat_1 ASG"
  alarm_actions       = var.squidnat_cw_alarm_failure_actions

  treat_missing_data  = "notBreaching"

  dimensions = {
    AutoScalingGroupName = module.microservice_squidnat_1.autoscaling_group_name
  }
}

resource "aws_cloudwatch_metric_alarm" "squidnat_2_unhealthyhost" {
  alarm_name          = "${local.csi}-squidnat-2-unhealthy-host"

  count               = var.squidnat_unhealthy_host_alarm_count
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/Auto Scaling"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy host in the TARS squidnat_2 ASG"
  alarm_actions       = var.squidnat_cw_alarm_failure_actions

  treat_missing_data  = "notBreaching"

  dimensions = {
    AutoScalingGroupName = module.microservice_squidnat_2.autoscaling_group_name
  }
}
