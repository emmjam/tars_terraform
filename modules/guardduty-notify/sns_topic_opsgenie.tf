resource "aws_sns_topic" "guardduty_opsgenie" {
  name = "${local.csi}-guardduty-opsgenie"

  tags = merge(
   local.default_tags,
    map(
      "Name", "${local.csi}-guardduty-opsgenie",
    ),
  )
}

resource "aws_sns_topic_subscription" "guardduty_opsgenie" {
  count                  = var.opsgenie_sns_topic_sub_create ? 1 : 0
  topic_arn              = aws_sns_topic.guardduty_opsgenie.arn
  protocol               = var.opsgenie_sns_topic_sub_protocol
  endpoint               = var.opsgenie_sns_topic_sub_endpoint
  endpoint_auto_confirms = "true"
}

resource "aws_sns_topic_policy" "guardduty_opsgenie" {
  arn    = aws_sns_topic.guardduty_opsgenie.arn
  policy = data.aws_iam_policy_document.guardduty_opsgenie.json
}
