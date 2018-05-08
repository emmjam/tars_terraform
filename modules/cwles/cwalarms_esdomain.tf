##
# Cloudwatch Alarms for the Elasticsearch Domain
##

resource "aws_cloudwatch_metric_alarm" "es_jvm_pressure_high" {
  alarm_name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "es-jvm-pressure-high"
  )}"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "JVMMemoryPressure"
  namespace           = "AWS/ES"

  dimensions {
    DomainName = "${aws_elasticsearch_domain.es.domain_name}"
    ClientId   = "${var.aws_account_id}"
  }

  period            = "60"
  statistic         = "Average"
  threshold         = "75"
  unit              = "Percent"
  alarm_description = "ALARM when cluster average JVM Memory Pressure exceeds 75% in previous 1m."

  alarm_actions = [
    "${var.es_metric_alarm_actions}",
  ]
}

resource "aws_cloudwatch_metric_alarm" "es_master_jvm_pressure_high" {
  alarm_name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "es-master-jvm-pressure-high"
  )}"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "MasterJVMMemoryPressure"
  namespace           = "AWS/ES"

  dimensions {
    DomainName = "${aws_elasticsearch_domain.es.domain_name}"
    ClientId   = "${var.aws_account_id}"
  }

  period            = "60"
  statistic         = "Average"
  threshold         = "75"
  unit              = "Percent"
  alarm_description = "ALARM when cluster average Master JVM Memory Pressure exceeds 75% in previous 1m."

  alarm_actions = [
    "${var.es_metric_alarm_actions}",
  ]
}

resource "aws_cloudwatch_metric_alarm" "es_cluster_status_unhealthy" {
  alarm_name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "es-cluster-unhealthy"
  )}"

  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "ClusterStatus.green"
  namespace           = "AWS/ES"

  dimensions {
    DomainName = "${aws_elasticsearch_domain.es.domain_name}"
    ClientId   = "${var.aws_account_id}"
  }

  period            = "60"
  statistic         = "Minimum"
  threshold         = "1"
  alarm_description = "ALARM when cluster status isn't green for any amount of time."

  alarm_actions = [
    "${var.es_metric_alarm_actions}",
  ]
}
