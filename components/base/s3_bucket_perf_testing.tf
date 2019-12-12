resource "aws_s3_bucket" "perf-testing" {
  bucket        = "${local.csi_global}-perf-testing"
  acl           = "private"
  force_destroy = "true"

  website {
    index_document = "index.html"
  }

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
    target_bucket = aws_s3_bucket.bucketlogs.id
    target_prefix = "${local.csi_global}-perf-testing/"
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-perf-testing"
    },
  )
}

resource "aws_s3_bucket_policy" "perf-testing" {
  bucket = aws_s3_bucket.perf-testing.id
  policy = data.aws_iam_policy_document.perf-testing.json
}

