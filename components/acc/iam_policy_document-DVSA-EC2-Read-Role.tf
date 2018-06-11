data "aws_iam_policy_document" "DVSA-EC2-Read-Role" {
  statement {
    sid = "1"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::233824316563:user/CLI-ReadOnly01",
      ]
    }
  }
}
