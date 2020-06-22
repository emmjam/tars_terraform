# A trust policy to allow users from soc AWS account to assume a role
data "aws_iam_policy_document" "soc_assumerole" {
  statement {
    sid    = "TrustSocToAssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "${format(
          "%s:%s:%s",
          "arn:aws:iam:",
          "164381891383",
          "root"
        )}",
      ]
    }
  }
}
