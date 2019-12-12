module "ebs-snapshots" {
  source = "../../modules/ebs-snapshots-tf"

  snapshot_name = "ebs-snapshots"
  project       = var.project
  environment   = var.environment
  component     = var.component

  cw_rule_enabled = var.ebs_snapshot_is_enabled

  memory_size = var.ebs_snapshot_memory_size
  publish     = var.ebs_snapshot_publish
  timeout     = var.ebs_snapshot_timeout

  snapshot_s3_bucket = module.snapshots_bucket.id
  snapshot_s3_key    = var.ebs_snapshot_s3_key

  cwlg_retention = var.ebs_snapshot_cloudwatch_log_retention_in_days
  aws_region     = var.aws_region

  # TODO: peacheym: Shouldn't this be two values in a list, not a single csv string?
  volume_ids = [
    "${module.jenkins.ebs_volume_id},${module.gitlab.ebs_volume_id}",
  ]

  cw_rule_schedule_expression = var.ebs_snapshot_cw_rule_schedule_expression

  log_error_pattern = var.ebs_snapshot_cw_metric_log_error_pattern

  cw_alarm_failure_actions = [
    data.terraform_remote_state.acc.outputs.notify_ops_sns_arn,
  ]

  cw_alarm_namespace      = "${local.csi}-ebs-snapshot-lambda"
  cleanup_name            = "ebs-snapshots-cleanup"
  snapshot_retention_days = var.ebs_snapshot_cleanup_min_retention_days
  min_snapshots_per_vol   = var.ebs_snapshot_cleanup_min_num_of_snapshots_to_retain

  cleanup_cw_rule_enabled = var.ebs_snapshot_is_enabled

  cleanup_memory_size = var.ebs_snapshot_cleanup_memory_size
  cleanup_publish     = var.ebs_snapshot_cleanup_publish
  cleanup_timeout     = var.ebs_snapshot_cleanup_timeout

  cleanup_s3_bucket = module.snapshots_bucket.id
  cleanup_s3_key    = var.ebs_snapshot_cleanup_s3_key

  cleanup_cwlg_retention = var.ebs_snapshot_cleanup_cloudwatch_log_retention_in_days

  cleanup_cw_rule_schedule_expression = var.ebs_snapshot_cleanup_cw_rule_schedule_expression

  cleanup_log_error_pattern = var.ebs_snapshot_cleanup_cw_metric_log_error_pattern

  cleanup_cw_alarm_failure_actions = [
    data.terraform_remote_state.acc.outputs.notify_ops_sns_arn,
  ]

  cleanup_cw_alarm_namespace = "${local.csi}-ebs-snapshot-cleanup-lambda"
}

