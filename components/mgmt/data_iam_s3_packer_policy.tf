data "aws_iam_policy_document" "s3-packer" {
  policy_id = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    "s3-packer"
  )}"

  statement {
    sid    = "AllowS3"
    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:HeadBucket",
      "s3:ListObjects"
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
      "${module.artefacts_bucket.arn}/*",
      "${module.artefacts_bucket.arn}",
    ]
  }
}
