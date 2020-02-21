output "platform_lambda_bucket_name" {
  value       = "${var.lambda_platform_bucket}"
  description = "Name of the bucket holding platform related lambdas"
}

output "lambda_guardduty_lambda_arn" {
  value       = "${aws_lambda_function.guardduty_slack.arn}"
  description = "The Amazon Resource Name (ARN) identifying the Guardduty Notify Lambda Function"
}

output "cw_log_group_slack_lambda_arn" {
  value       = "${aws_cloudwatch_log_group.lambda_guardduty_slack.arn}"
  description = "ARN for the Cloudwatch Log Group for the Slack Notify Lambda"
}

output "cw_log_group_slack_lambda_name" {
  value       = "${aws_cloudwatch_log_group.lambda_guardduty_slack.name}"
  description = "Name of the Cloudwatch Log Group for the Slack Notify Lambda"
}

output "cw_event_guardduty_slack_id" {
  value       = "${aws_cloudwatch_event_rule.guardduty_slack.id}"
  description = "ID of the Cloudwatch Event for Guardduty to Slack event"
}

output "cw_event_guardduty_slack_name" {
  value       = "${aws_cloudwatch_event_rule.guardduty_slack.name}"
  description = "Name of the Cloudwatch Event for Guardduty to Slack event"
}

output "cw_event_guardduty_slack_arn" {
  value       = "${aws_cloudwatch_event_rule.guardduty_slack.arn}"
  description = "ARN of the Cloudwatch Event for Guardduty to Slack event"
}

output "cw_event_guardduty_opsgenie_id" {
  value       = "${aws_cloudwatch_event_rule.guardduty_opsgenie.id}"
  description = "ID of the Cloudwatch Event for Guardduty to Opsgenie event"
}

output "cw_event_guardduty_opsgenie_name" {
  value       = "${aws_cloudwatch_event_rule.guardduty_opsgenie.name}"
  description = "Name of the Cloudwatch Event for Guardduty to Opsgenie event"
}

output "cw_event_guardduty_opsgenie_arn" {
  value       = "${aws_cloudwatch_event_rule.guardduty_opsgenie.arn}"
  description = "ARN of the Cloudwatch Event for Guardduty to Opsgenie event"
}

output "sns_guardduty_opsgenie_id" {
  value       = "${aws_sns_topic.guardduty_opsgenie.id}"
  description = "ID of the SNS Topic for Guardduty to Opsgenie event"
}

output "sns_guardduty_opsgenie_name" {
  value       = "${aws_sns_topic.guardduty_opsgenie.name}"
  description = "Name of the SNS Topic for Guardduty to Opsgenie"
}

output "sns_guardduty_opsgenie_arn" {
  value       = "${aws_sns_topic.guardduty_opsgenie.arn}"
  description = "ARN of the SNS Topic for Guardduty to Opsgenie"
}
