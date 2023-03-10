# A generic standard private S3 bucket with versioning,
# logging and lifecycle management to be used as a target
# for logs for any other bucket created by this component
# or any module called by this component
resource "aws_s3_bucket" "bucketlogs" {
  bucket        = "${local.csi_global}-bucketlogs"
  acl           = "log-delivery-write"
  force_destroy = "true"

  # Enable versioning
  versioning {
    enabled = true
  }

  # Enable Logging to Self
  logging {
    target_bucket = "${local.csi_global}-bucketlogs"
    target_prefix = "${local.csi_global}-bucketlogs/"
  }

  # Rotate logs out to cheaper storage
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

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-bucketlogs"
    },
  )
}

