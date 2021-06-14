resource "aws_cloudwatch_metric_alarm" "rds_cpuutilization_average" {
  count                =  var.rds_cw_metric_alarm_enabled ? 1 : 0
  alarm_name           = "${local.csi}-rds-cpuutilization-average"
  comparison_operator  = "GreaterThanOrEqualToThreshold"
  evaluation_periods   = "3"
  metric_name          = "CPUUtilization"
  namespace            = "AWS/RDS"

  dimensions  = {
    DBInstanceIdentifier    = aws_db_instance.tarsdb.id
  }

  period               = "60"
  statistic            = "Average"
  threshold            = "85"
  unit                 = "Percent"
  alarm_description    = "Alarm when the Average RDS CPU Utilization exceeds 85% for a period of 3 minutes."
  actions_enabled      = var.rds_cw_metric_alarm_action_enabled
  alarm_actions        = [data.terraform_remote_state.base.outputs.sns_alerts_arn]
}
