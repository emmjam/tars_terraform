resource "aws_cloudwatch_metric_alarm" "ibs_high_CPU" {
  alarm_name                = "${local.csi}-ibs-high-cpu"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  count		            = var.ibs_high_cpu_cw_metric_alarm_enabled ? 1 : 0
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "95"
  alarm_description         = "This metric monitors IBS ec2 cpu utilization"
  alarm_actions       = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
  treat_missing_data  = "notBreaching"
  dimensions = {
    AutoScalingGroupName = "${local.csi}/ibs"
  }
 }
