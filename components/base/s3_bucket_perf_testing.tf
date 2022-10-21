resource "aws_s3_bucket" "perf-testing" {
  bucket        = "${local.csi_global}-perf-testing"
  force_destroy = "true"

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

# providers resource updates
resource "aws_s3_bucket_acl" "perf-testing" {
  bucket = aws_s3_bucket.perf-testing.id
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "perf-testing" {
  bucket = aws_s3_bucket.perf-testing.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_versioning" "perf-testing" {
  bucket = aws_s3_bucket.perf-testing.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Rotate logs out to cheaper storage
# Delete after 2 years
resource "aws_s3_bucket_lifecycle_configuration" "perf-testing" {
  bucket = aws_s3_bucket.perf-testing.id

  rule {
    id = "wholebucket-noncurrent"

    filter {
      prefix = "/"
    }

    noncurrent_version_transition {
      noncurrent_days = "30"
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = "60"
      storage_class   = "GLACIER"
    }

    noncurrent_version_expiration {
      noncurrent_days = "732"
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "perf-testing" {
  bucket = aws_s3_bucket.perf-testing.id

  target_bucket = aws_s3_bucket.bucketlogs.id
  target_prefix = "${local.csi_global}-perf-testing/"
}