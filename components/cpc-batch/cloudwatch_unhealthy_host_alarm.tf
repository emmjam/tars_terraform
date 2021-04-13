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