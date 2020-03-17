resource "aws_sns_topic_subscription" "opsgenie" {
  topic_arn              = data.terraform_remote_state.base.outputs.sns_alerts_arn
  protocol               = "https"
  endpoint               = var.opsgenie_endpoint
  endpoint_auto_confirms = "true"

}