resource "aws_sns_topic" "nexus_opsgenie" {
  name  = "${local.csi}-nexus-opsgenie"
  count = var.environment == "mgmt" ? 1 : 0

  tags = merge(
    local.default_tags,
    tomap({ "Name" = "${local.csi}-nexus-opsgenie" })
  )
}

resource "aws_sns_topic_subscription" "nexus_opsgenie" {
  count                  = var.environment == "mgmt" ? 1 : 0
  topic_arn              = aws_sns_topic.nexus_opsgenie[0].arn
  protocol               = "https"
  endpoint               = var.opsgenie_endpoint #needs to be changes
  endpoint_auto_confirms = "true"
}

resource "aws_sns_topic_policy" "opsgenie_policy" {
  count  = var.environment == "mgmt" ? 1 : 0
  arn    = aws_sns_topic.nexus_opsgenie[0].arn
  policy = data.aws_iam_policy_document.nexus_alerts_sns[0].json
}
