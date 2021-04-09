resource "aws_cloudwatch_metric_alarm" "TARS_messaging_unhealthyhost" {
  alarm_name          = "${local.csi}-TARS-messaging-unhealthy-host"
  count               = var.wms_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "ALARM when there is an unhealthy host in the Windows Messagins ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn, aws_sns_topic.wms_unhealthy_host[0].arn]
  treat_missing_data  = "notBreaching"
  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.tars-messaging.name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "TARS_messaging_cpu_utilization_too_high" {
  alarm_name          = "${local.csi}-TARSmessaging-cpu-utilization-too-high"
  count               = var.wms_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.cpu_utilization_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.cpu_utilization_period
  statistic           = "Average"
  threshold           = var.cpu_utilization_threshold
  alarm_description   = "ALARM when the average CPU utilization is too high in the Windows Messaging ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn, aws_sns_topic.wms_cpu_utilization_too_high[0].arn]
  treat_missing_data  = "notBreaching"
  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.tars-messaging.name}"
  }
}
