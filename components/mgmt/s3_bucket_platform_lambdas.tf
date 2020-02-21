# For Platform specific Lambdas, primarily for the production environment
resource "aws_s3_bucket" "lambda-platform" {
  bucket = "${replace(
    format(
      "%s-%s-%s-%s-%s-%s",
      var.project,
      var.aws_account_id,
      var.aws_region,
      var.environment,
      var.component,
      "lambda-platform"
    ),
    "_",
    ""
  )}"

  acl           = "private"
  force_destroy = "true"

  # Enable versioning
  versioning {
    enabled = true
  }

  # Rotate out old versions to cheaper storage
  # Delete after 2 years
  lifecycle_rule {
    id      = "wholebucket-noncurrent"
    prefix  = "/"
    enabled = "true"

    noncurrent_version_transition {
      days          = "30"
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = "60"
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = "732"
    }
  }

  logging {
    target_bucket = "${aws_s3_bucket.bucketlogs.id}"

    target_prefix = "${replace(
      format(
        "%s-%s-%s-%s-%s-%s",
        var.project,
        var.aws_account_id,
        var.aws_region,
        var.environment,
        var.component,
        "lambda-platform"
      ),
      "_",
      ""
    )}/"
  }

  tags = "${merge(
    var.default_tags,
    map(
      "Name", replace(
        format(
          "%s-%s-%s-%s-%s-%s",
          var.project,
          var.aws_account_id,
          var.aws_region,
          var.environment,
          var.component,
          "lambda-platform"
        ),
        "_",
        ""
      ),
      "Component", var.component
    )
  )}"
}
