data "aws_iam_policy_document" "perf-testing" {
  statement {
    actions = [
      "s3:GetObject",
    ]
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [ "*" ]
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

data "aws_iam_policy_document" "perf-testing-upload" {
  statement {
    actions = [
      "s3:*",
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.perf-testing.arn}",
      "${aws_s3_bucket.perf-testing.arn}/*",
    ]
  }

}



