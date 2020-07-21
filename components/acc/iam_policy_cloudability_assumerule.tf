# A trust policy to allow users from cloudability AWS account to assume a role
data "aws_iam_policy_document" "allow_cloudability_assumerole" {
  statement {
    sid    = "trustCloudabilityToAssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "${format(
          "%s::%s:%s",
          "arn:aws:iam",
          lookup(
            var.cloudability_xacct,
            "aws_account_id"
          ),
          "root",
        )}",
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [
        "${lookup(
          var.cloudability_xacct,
          "external_id"
        )}",
      ]
    }
  }
}
