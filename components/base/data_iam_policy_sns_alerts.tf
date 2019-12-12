data "aws_iam_policy_document" "alerts_sns" {
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
      aws_sns_topic.alerts.arn,
    ]
  }
}

