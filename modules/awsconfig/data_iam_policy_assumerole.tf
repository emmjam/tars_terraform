# The Assume Role policy to allows AWS Config
# to assume the role we create for it that will
# allow it to read our AWS account configuration
# and write changes to our output bucket
data "aws_iam_policy_document" "assumerole" {
  statement {
    sid    = "AWSConfigAssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "config.amazonaws.com",
      ]
    }
  }
}

