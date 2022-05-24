resource "aws_cloudwatch_metric_alarm" "rds_freestoragespace_average" {
  count               = var.rds_cw_metric_alarm_enabled ? 1 : 0
  alarm_name          = "${local.csi}-rds-freestoragespace-average"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"

  dimensions = {
    DBInstanceIdentifier = aws_db_instance.tarsdb.id
  }

  period            = "300"
  statistic         = "Average"
  threshold         = "${var.tars_rds_allocated_storage}00000000" # 10% of allocated storage
  unit              = "Bytes"
  alarm_description = "Alarm when the Average RDS Free Storage Space is less than or equal to 5GB for a period of 5 minutes."
  actions_enabled   = var.rds_cw_metric_freestoragespace_alarm_action_enabled
  alarm_actions     = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
}