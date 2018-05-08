##
# Cloudwatch Alarms for the Elasticsearch Domain
##

resource "aws_sns_topic" "cwles" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles"
  )}"
}

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
  evaluation_periods  = "5"
  metric_name         = "JVMMemoryPressure"
  namespace           = "AWS/ES"

  dimensions {
    DomainName = "${aws_elasticsearch_domain.es.domain_name}"
    ClientId   = "${var.aws_account_id}"
  }

  period            = "60"
  statistic         = "Maximum"
  threshold         = "75"
  unit              = "Percent"
  alarm_description = "ALARM when cluster JVM Memory Pressure exceeds 75% in previous 5m."

  alarm_actions = [
    "${aws_sns_topic.cwles.id}",
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
  evaluation_periods  = "5"
  metric_name         = "MasterJVMMemoryPressure"
  namespace           = "AWS/ES"

  dimensions {
    DomainName = "${aws_elasticsearch_domain.es.domain_name}"
    ClientId   = "${var.aws_account_id}"
  }

  period            = "60"
  statistic         = "Maximum"
  threshold         = "75"
  unit              = "Percent"
  alarm_description = "ALARM when cluster Master JVM Memory Pressure exceeds 75% in previous 5m."

  alarm_actions = [
    "${aws_sns_topic.cwles.id}",
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
    "${aws_sns_topic.cwles.id}",
  ]
}
