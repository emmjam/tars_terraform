resource "aws_sns_topic_subscription" "opsgenie_alerts" {
  topic_arn              = data.terraform_remote_state.acc.outputs.notify_ops_sns_arn
  protocol               = "https"
  endpoint               = var.opsgenie_endpoint
  endpoint_auto_confirms = "true"
}