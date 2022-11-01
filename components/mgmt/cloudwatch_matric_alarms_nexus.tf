# CloudWatch monitoring Nexus AL2

resource "aws_cloudwatch_metric_alarm" "ebs_utilization_nexus" {
  alarm_name = (format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "nexus-ebs-utilization"
  ))

  alarm_description    = "This alarms if the EBS of the Nexus EC2 instance is exceeding 90%"
  comparison_operator  = "GreaterThanOrEqualToThreshold"
  namespace            = "tars-mgmt-nexus/nexus-custom-stats"
  metric_name          = "DiskUse"
  evaluation_periods   = "15"
  threshold            = "90"
  statistic            = "Average"
  period               = "900"

  treat_missing_data  = "notBreaching"
  alarm_actions       = ["${aws_sns_topic.nexus_opsgenie[0].arn}"]
  datapoints_to_alarm = 3
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_nexus" {
  alarm_name = (format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "nexus-cpu-utilization"
  ))

  alarm_description   = "This alarms if the CPU of the Nexus EC2 instance is exceeding 80%"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  evaluation_periods  = "2"
  threshold           = "80"
  statistic           = "Average"
  datapoints_to_alarm = 2
  period              = "120"

  dimensions = {
    AutoScalingGroupName = "${module.microservice_nexus.autoscaling_group_name}"
  }

  treat_missing_data = "notBreaching"
  alarm_actions      = ["${aws_sns_topic.nexus_opsgenie[0].arn}"]
}

resource "aws_cloudwatch_metric_alarm" "nexus_alb_https_unhealthy_host_alert" {
  alarm_name = (format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "nexus-alb-https-unhealthy-host-alert"
  ))

  alarm_description   = "nexus alb unhealthy host alert"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  namespace           = "AWS/ApplicationELB"
  metric_name         = "UnHealthyHostCount"
  evaluation_periods  = "1"
  threshold           = "1"
  statistic           = "Sum"
  period              = "60"

  dimensions = {
    "TargetGroup"     = "${aws_alb_target_group.nexus.arn_suffix}"
    "LoadBalancer"    = "${aws_alb.public.arn_suffix}"
  }

  treat_missing_data  = "notBreaching"
  alarm_actions       = ["${aws_sns_topic.nexus_opsgenie[0].arn}"]
  datapoints_to_alarm = 1
}
