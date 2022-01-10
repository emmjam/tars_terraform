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
  },
  {
    sid    = "Enable IAM policies"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root"]
    }

    actions =  [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:CreateGrant",
                "kms:DescribeKey"
            ]

    resources = [
      "*"
    ]
    condition = {
                test     = "StringEquals"
                variable = "kms:CallerAccount"
                values = [ "652856684323" ]
            }
    condition = {
                test     = "StringEquals"
                variable = "kms:ViaService"
                values = [ "sqs.eu-west-1.amazonaws.com" ]
            }
  }
}
