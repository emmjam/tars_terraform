data "aws_iam_policy_document" "oraclexe" {
  statement {
    sid    = "AllowEC2AssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]
   resources = [
      "*",
    ]
  }
  statement {
    sid     = "AllowS3DeleteGetPutObjectandListBucket"
    effect  = "Allow"
    actions = [
      "s3:DeleteObject",
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket"
    ]
    resources = [
      aws_s3_bucket.resources.arn,
      "${aws_s3_bucket.resources.arn}/${local.csi}-oraclexe-data/*",
    ]
  }
}
