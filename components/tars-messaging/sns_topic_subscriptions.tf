resource "aws_sns_topic_subscription" "wms_unhealthy_hosts_opsgenie" {
  topic_arn              = data.terraform_remote_state.base.outputs.sns_alerts_arn
  count                  = var.wms_host_alarm_count
  protocol               = "https"
  endpoint               = var.opsgenie_endpoint
  endpoint_auto_confirms = "true"
}