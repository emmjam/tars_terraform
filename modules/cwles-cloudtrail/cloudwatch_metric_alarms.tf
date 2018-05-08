resource "aws_cloudwatch_metric_alarm" "cloudtrail" {
  count = "${length(var.custom_metrics)}"

  actions_enabled = "true",

  alarm_actions = [
    "${var.cloudwatch_metric_alarm_actions}",
  ]

  alarm_description = "${format(
    "%s: https://%s/_plugin/kibana3/#/dashboard/elasticsearch/%s",
    lookup(var.custom_metrics[count.index], "name"),
    var.cwles_logstoes_es_domain_endpoint,
    lookup(var.custom_metrics[count.index], "name")
  )}"
 
  alarm_name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module,
    lookup(var.custom_metrics[count.index], "name")
  )}"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "${lookup(var.custom_metrics[count.index], "name")}"

  namespace = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module
  )}"

  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  treat_missing_data  = "notBreaching"
}
