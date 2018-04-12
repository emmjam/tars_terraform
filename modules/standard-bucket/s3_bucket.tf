# A generic standard private S3 bucket with versioning,
# logging and lifecycle management
resource "aws_s3_bucket" "standard" {
  bucket        = "${replace(var.name, "_", "")}"
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

  # Enable Logging to Self
  logging {
    target_bucket = "${var.log_bucket}"
    target_prefix = "${replace(var.name, "_", "")}/"
  }

  tags = "${merge(
    "${var.tags}",
    map(
      "Name", replace(var.name, "_", "")
    )
  )}"
}
