resource "aws_sns_topic_subscription" "wms_unhealthy_hosts_opsgenie" {
  count                  = var.environment == "prod" ? 1 : 0
  topic_arn              = data.terraform_remote_state.base.outputs.sns_alerts_arn
  protocol               = "https"
  endpoint               = var.opsgenie_endpoint
  endpoint_auto_confirms = "true"
}
