resource "aws_cloudwatch_metric_alarm" "batch_unhealthyhost" {
  alarm_name          = "${local.csi}-batch-unhealthy-host"

  count               = var.unhealthy_host_alarm_count
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the TARS batch ASG"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"

  dimensions = {
    TargetGroup  = aws_alb_target_group.tars-batch-8080.arn_suffix
    LoadBalancer = aws_alb.tars-alb-batch-private.arn_suffix
  }
}