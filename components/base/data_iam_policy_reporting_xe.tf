data "aws_iam_policy_document" "reportingxe" {
  statement {
    sid    = "AllowKMSDecrypt"
    effect = "Allow"

    actions = [
      "kms:Decrypt",
    ]
    resources = [
      "arn:aws:kms:${var.aws_region}:${var.aws_account_id}:key/${var.ssm_kms_key_id}"
    ]
  }
  statement {
    sid    = "AllowGetParameter"
    effect = "Allow"
    actions = [
      "ssm:GetParameter"
    ]
    resources = [
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/reporting-xe/all*"
    ]
  }

  statement {
    sid    = "AttachNetworkInterface"
    effect = "Allow"
    actions = [
      "ec2:AttachNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
    ]
    resources = [
      "*"
    ]
  }
}