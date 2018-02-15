data "aws_iam_policy_document" "user" {
  policy_id = "${format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module,
    var.name,
    "user"
  )}"

  statement {
    sid    = "AllowUseOfTheKmskey"
    effect = "Allow"

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
    ]

    resources = [
      "${aws_kms_key.main.arn}",
    ]
  }
}
