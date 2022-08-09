# CloudWatch monitoring Nexus AL2

# A cloudwatch metric will also need to be added for ebs utilisation for the nexus instance. This will be done as part of OPS-4468

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_nexus" {
  alarm_name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "nexus-cpu-utilization"
  )}"

  alarm_description   = "This alarms if the CPU of the Nexus EC2 instance is exceeding 80%"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  evaluation_periods  = "2"
  threshold           = "80"
  statistic           = "Average"
  period              = "120"

  dimensions = {
    AutoScalingGroupName = "${module.microservice_nexus.autoscaling_group_name}"
  }

  treat_missing_data  = "notBreaching"
  alarm_actions       = [ "${aws_sns_topic.nexus_opsgenie[0].arn}" ]
}

resource "aws_cloudwatch_metric_alarm" "nexus_alb_https_unhealthy_host_alert" {
  alarm_name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "nexus-alb-https-unhealthy-host-alert"
  )}"

  alarm_description   = "nexus alb unhealthy host alert"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  namespace           = "AWS/ApplicationELB"
  metric_name         = "UnHealthyHostCount"
  evaluation_periods  = "1"
  threshold           = "1"
  statistic           = "Sum"
  period              = "60"

  dimensions = {
    "TargetGroup"  = "${aws_alb_target_group.nexus.arn_suffix}"
    "LoadBalancer" = "${aws_alb.public.arn_suffix}"
  }

  treat_missing_data  = "notBreaching"
  alarm_actions       = [ "${aws_sns_topic.nexus_opsgenie[0].arn}" ]
}
