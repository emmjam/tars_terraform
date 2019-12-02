resource "aws_s3_bucket" "dbreports_output" {
  bucket = "${local.csi_global}-dbreports-output"
  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi_global}-dbreports-output"
    )
  )}"

  force_destroy = "false"

  # Enable versioning
  versioning {
    enabled = true
  }

  # Rotate files out to cheaper storage
  # Delete after 2 years
  lifecycle_rule {
    id      = "wholebucket"
    prefix  = "/"
    enabled = "true"

    transition {
      days          = "30"
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = "60"
      storage_class = "GLACIER"
    }

    expiration {
      days = "732"
    }

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

}