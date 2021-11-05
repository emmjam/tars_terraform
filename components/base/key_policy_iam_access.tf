data "aws_iam_policy_document" "kms_root_managed" {
  statement {
    sid    = "Enable IAM policies"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root"]
    }

    actions = [
      "kms:*"
    ]

    resources = [
      "*"
    ]
  }
}
