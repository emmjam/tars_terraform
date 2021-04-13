resource "aws_cloudwatch_metric_alarm" "public_gitlab_unhealthyhost" {
  alarm_name          = "${local.csi}-public-gitlab-unhealthy-host"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the gitlab public ASG"
  alarm_actions       =  var.gitlab_cw_alarm_failure_actions
  treat_missing_data  = "notBreaching"

  dimensions = {
    LoadBalancerNAme = aws_elb.gitlab_public.name
  }
}


resource "aws_cloudwatch_metric_alarm" "private_gitlab_unhealthyhost" {
  alarm_name          = "${local.csi}-private-gitlab-unhealthy-host"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Unhealthy Hosts Count in the gitlab private ASG"
  alarm_actions       = var.gitlab_cw_alarm_failure_actions
  treat_missing_data  = "notBreaching"

  dimensions = {
    LoadBalancerName = aws_elb.gitlab_private.name
  }
}