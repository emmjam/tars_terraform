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
    sid    = "AllowS3DeleteGetPutObjectandListBucket"
    effect = "Allow"
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
  statement {
    sid    = "AmiKmsKey"
    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:ReEncryptTo",
      "kms:DescribeKey",
      "kms:CreateGrant",
      "kms:ReEncryptFrom",
    ]

    resources = [
      "arn:aws:kms:eu-west-1:645711882182:key/303c3787-4bb4-4c17-a9d7-7870544b1d46",
    ]
  }
}
