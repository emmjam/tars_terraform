data "aws_iam_policy_document" "mgmt_trust" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::645711882182:root",
      ]
    }

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"

      values = [
        "true",
      ]
    }
    condition {
      test     = "StringLike"
      variable = "sts:RoleSessionName"
      values   = [
         "$${aws:username}",
      ]
    }
  }
}
