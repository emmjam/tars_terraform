# TODO: peacheym: Give this a descriptive name identifying
#                 what activity this policy is intended to
#                 provide and if it is a bucket policy, the
#                 fact that it is a bucket policy rather than
#                 a role policy
data "aws_iam_policy_document" "perf-testing" {
  statement {
    # TODO: peacheym: sid = "RealDescriptiveName"
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "*",
      ]
    }

    resources = [
      "${aws_s3_bucket.perf-testing.arn}",
      "${aws_s3_bucket.perf-testing.arn}/*",
    ]

    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"

      values = [
        "${var.whitelist}",
      ]
    }
  }
}

# TODO: peacheym: Give this a descriptive name identifying
#                 what activity this policy is intended to
#                 provide and if it is a bucket policy, the
#                 fact that it is a bucket policy rather than
#                 a role policy (but this one I don't think is)
data "aws_iam_policy_document" "perf-testing-upload" {
  statement {
    # TODO: peacheym: sid = "RealDescriptiveName"
    effect = "Allow"

    actions = [
      "s3:*",
    ]

    resources = [
      "${aws_s3_bucket.perf-testing.arn}",
      "${aws_s3_bucket.perf-testing.arn}/*",
    ]
  }
}
