data "aws_iam_policy_document" "guardduty_opsgenie" {
  policy_id = "${local.csi}-sns"

  statement {
    sid = "GuardDutyOpsGenieSNS"

    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        "${data.aws_caller_identity.current.account_id}",
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "${aws_sns_topic.guardduty_opsgenie.arn}",
    ]

  }

  statement {
    sid    = "GuardDutyOpsGenieSNSAWSEvents"
    effect = "Allow"

    actions = [
      "SNS:Publish",
    ]

    principals {
      type = "Service"

      identifiers = [
        "events.amazonaws.com",
      ]
    }

    resources = [
      "${aws_sns_topic.guardduty_opsgenie.arn}",
    ]
  }
}
