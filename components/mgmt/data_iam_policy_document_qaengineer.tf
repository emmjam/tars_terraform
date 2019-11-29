data "aws_iam_policy_document" "assume_qaengineer_role" {
  statement {
    sid    = "AllowAssumeQAEngineerRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::652856684323:role/QAEngineer"
    ]
  }
}
