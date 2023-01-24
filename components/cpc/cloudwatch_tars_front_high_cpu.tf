resource "aws_cloudwatch_metric_alarm" "tars_front_high_CPU" {
  alarm_name          = "${local.csi}-tars-front-high-cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  count               = var.tars_front_high_cpu_cw_metric_alarm_enabled
  namespace           = "AWS/EC2"
  period              = "60"
  datapoints_to_alarm = "5"
  statistic           = "Maximum"
  threshold           = "60"
  alarm_description   = "This metric monitors TARS_Front ec2 cpu utilization"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"
  dimensions = {
    AutoScalingGroupName = "${local.csi}/cpc-front"
  }
}