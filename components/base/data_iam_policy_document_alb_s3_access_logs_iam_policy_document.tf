data "aws_iam_policy_document" "alb_s3_access_logs_iam_policy_document" {

  statement {
    sid     = "AllowELBLogging"
    effect  = "Allow"
    actions = ["s3:PutObject"]

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }

    resources = [aws_s3_bucket.bucketlogs.arn]
  }
}
