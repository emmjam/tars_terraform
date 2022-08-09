data "aws_iam_policy_document" "nexus_alerts_sns" {
  count = var.environment == "mgmt" ? 1 : 0
  statement {
    sid    = "AllowMatchingSourceOwnerToPublishToAlertsTopic"
    effect = "Allow"

    actions = [
      "SNS:Publish",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "*",
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        var.aws_account_id,
      ]
    }

    resources = [
      aws_sns_topic.nexus_opsgenie[0].arn,
    ]
  }
}
