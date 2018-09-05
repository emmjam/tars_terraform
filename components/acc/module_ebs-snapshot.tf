module "ebs-snapshot" {
  source        = "../../modules/ebs-snapshot"
  snapshot_name = "ebs-snapshot"
  cleanup_name  = "ebs-snapshot-cleanup"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  cw_rule_enabled = "${lookup(var.ebs_snapshot,"is_enabled")}"

  memory_size = "${lookup(var.ebs_snapshot,"memory_size")}"
  publish     = "${lookup(var.ebs_snapshot,"publish")}"
  timeout     = "${lookup(var.ebs_snapshot,"timeout")}"

  snapshot_s3_bucket = "${module.snapshots_bucket.id}"
  snapshot_s3_key    = "${lookup(var.ebs_snapshot,"snapshot_s3_key")}"
  cwlg_retention     = "${lookup(var.ebs_snapshot,"cloudwatch_log_retention_in_days")}"
  aws_region         = "${var.aws_region}"
  aws_account_id     = "${var.aws_account_id}"

  node_types   = "${var.ebs_snapshot_node_types}"
  environments = "${var.ebs_snapshot_environments}"

  cw_rule_schedule_expression = "${lookup(var.ebs_snapshot,"cw_rule_schedule_expression")}"
  log_error_pattern           = "${lookup(var.ebs_snapshot,"cw_metric_log_error_pattern")}"

  cw_alarm_failure_actions = [
    "${aws_sns_topic.alerts.arn}",
  ]

  cw_alarm_namespace = "${format(
    "%s-%s",
    local.csi,
    lookup(var.ebs_snapshot,"cw_alarm_namespace")
  )}"

  snapshot_retention_days             = "${lookup(var.ebs_snapshot_cleanup,"min_retention_days")}"
  min_snapshots_per_vol               = "${lookup(var.ebs_snapshot_cleanup,"min_num_of_snapshots_to_retain")}"
  cleanup_cw_rule_enabled             = "${lookup(var.ebs_snapshot,"is_enabled")}"
  cleanup_memory_size                 = "${lookup(var.ebs_snapshot_cleanup,"memory_size")}"
  cleanup_publish                     = "${lookup(var.ebs_snapshot_cleanup,"publish")}"
  cleanup_timeout                     = "${lookup(var.ebs_snapshot_cleanup,"timeout")}"
  cleanup_s3_bucket                   = "${module.snapshots_bucket.id}"
  cleanup_s3_key                      = "${lookup(var.ebs_snapshot_cleanup,"cleanup_s3_key")}"
  cleanup_cwlg_retention              = "${lookup(var.ebs_snapshot_cleanup,"cloudwatch_log_retention_in_days")}"
  cleanup_cw_rule_schedule_expression = "${lookup(var.ebs_snapshot_cleanup,"cw_rule_schedule_expression")}"
  cleanup_log_error_pattern           = "${lookup(var.ebs_snapshot_cleanup,"cw_metric_log_error_pattern")}"
  cleanup_cw_alarm_failure_actions    = ["${aws_sns_topic.alerts.arn}"]

  cleanup_cw_alarm_namespace = "${format(
    "%s-%s",
    local.csi,
    lookup(var.ebs_snapshot_cleanup,"cw_alarm_namespace")
  )}"
}
