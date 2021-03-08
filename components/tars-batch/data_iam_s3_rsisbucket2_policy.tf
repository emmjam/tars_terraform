data "aws_iam_policy_document" "rsisbucket_tiff_repo2" {
  count          = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  policy_id = "${local.csi}-rsisbucket-tiff-repo2-"

  statement {
    sid    = "AllowS3"
    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowS3Access"
    effect = "Allow"

    actions = [
      "s3:*",
    ]

    resources = [
      "${aws_s3_bucket.rsisbucket_tiff_repo2[0].arn}",
      "${aws_s3_bucket.rsisbucket_tiff_repo2[0].arn}/*",
    ]
  }

}

resource "aws_iam_policy" "rsisbucket_tiff_repo2" {
  count          = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  name        = "${local.csi}-rsisbucket_tiff_repo2"
  description = "IAM policy for ${local.csi}-rsisbucket_tiff_repo2"
  policy      = data.aws_iam_policy_document.rsisbucket_tiff_repo2[0].json
}