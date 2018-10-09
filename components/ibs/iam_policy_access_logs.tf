# Policy for S3 access log bucket
data "aws_iam_policy_document" "alb_s3_access_logs_iam_policy_document" {
  statement {
    sid    = "AllowELBLogging"
    effect = "Allow"

    actions = [
      "s3:PutObject",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "${data.aws_elb_service_account.main.arn}",
      ]
    }

    resources = [
      "${module.access_logs_bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "squid_elb_s3_access_logs" {
  bucket = "${module.access_logs_bucket.id}"
  policy = "${data.aws_iam_policy_document.alb_s3_access_logs_iam_policy_document.json}"
}
