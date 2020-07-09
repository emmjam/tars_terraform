resource "aws_cloudwatch_metric_alarm" "rds_freestoragespace_average" {
  count                =  var.rds_cw_metric_alarm_enabled ? 1 : 0
  alarm_name           = "${local.csi}-rds-freestoragespace-average"
  comparison_operator  = "LessThanOrEqualToThreshold"
  evaluation_periods   = "1"
  metric_name          = "FreeStorageSpace"
  namespace            = "AWS/RDS"

  dimensions  = {
    DBInstanceIdentifier    = aws_db_instance.cpcdb.id
  }

  period               = "60"
  statistic            = "Average"
  threshold            = "90"
  unit                 = "Percent"
  alarm_description    = "Alarm when the Average RDS Free Storage Space exceeds 90% for a period of 1 minutes."
  actions_enabled      = var.rds_cw_metric_freestoragespace_alarm_action_enabled
  alarm_actions        = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
}