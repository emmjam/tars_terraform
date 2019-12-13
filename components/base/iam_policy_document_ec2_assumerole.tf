data "aws_iam_policy_document" "ec2_assumerole" {
  statement {
    sid    = "AllowEC2AssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com",
      ]
    }
  }
}

