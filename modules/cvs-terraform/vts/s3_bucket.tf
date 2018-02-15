resource "aws_s3_bucket" "main" {
  bucket        = "${var.bucket_prefix}.${var.environment}"
  force_destroy = "${var.bucket_force_destroy}"

  versioning {
    enabled = "${var.bucket_versioning_enabled}"
  }

  # policy = "${data.aws_iam_policy_document.s3_policy.json}"

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
