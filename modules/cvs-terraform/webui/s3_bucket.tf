resource "aws_s3_bucket" "main" {
  bucket        = "${var.bucket_prefix}.${var.environment}"
  force_destroy = "${var.bucket_force_destroy}"

  versioning {
    enabled = "${var.bucket_versioning_enabled}"
  }

  policy = "${data.aws_iam_policy_document.main.json}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "main",
      ),
      "Module", var.module
    )
  )}"
}

data "aws_iam_policy_document" "main" {
  statement {
    sid     = "AllowAssetsAccess"
    actions = ["s3:GetObject"]

    resources = [
      "arn:aws:s3:::${var.bucket_prefix}.${var.environment}/assets/*",
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}
