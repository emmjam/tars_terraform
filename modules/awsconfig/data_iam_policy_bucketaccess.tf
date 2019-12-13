# The IAM policy that permits AWS Config to write its output
# to the bucket that this module creates for the purpose
data "aws_iam_policy_document" "bucketaccess" {
  statement {
    sid    = "AWSConfigWriteBucketObjects"
    effect = "Allow"

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "${module.standard_bucket.arn}/*",
    ]
  }
}

