resource "aws_s3_bucket" "legacy-tape-archive" {
  bucket        = "${local.csi_global}-legacy-tape-archive"
  #acl           = "private"
  force_destroy = "true"

  /*# Enable versioning
  versioning {
    enabled = true
  }

  # Rotate out older files to cheaper storage
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
  }

  logging {
    target_bucket = aws_s3_bucket.bucketlogs.id
    target_prefix = "${local.csi_global}-legacy-tape-archive/"
  }*/

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-legacy-tape-archive"
    },
  )
}

resource "aws_s3_bucket_acl" "legacy-tape-archive" {
  bucket = aws_s3_bucket.legacy-tape-archive.id
  acl    = "private"
}

# Enable versioning
resource "aws_s3_bucket_versioning" "legacy-tape-archive" {
  bucket = aws_s3_bucket.legacy-tape-archive.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

# Rotate out older files to cheaper storage
resource "aws_s3_bucket_lifecycle_configuration" "legacy-tape-archive" {
  bucket = aws_s3_bucket.legacy-tape-archive.id

  rule {
    id = "wholebucket-noncurrent"

    filter {
      prefix = "/"
    }

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = "60"
      storage_class   = "GLACIER"
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "legacy-tape-archive" {
  bucket = aws_s3_bucket.legacy-tape-archive.id

  target_bucket = aws_s3_bucket.bucketlogs.id
  target_prefix = "${local.csi_global}-legacy-tape-archive/"
}
