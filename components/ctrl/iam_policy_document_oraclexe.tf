data "aws_iam_policy_document" "oraclexe" {
  statement {
    sid    = "AllowEC2AssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]
   resources = [
      "*",
    ]
  }
}

