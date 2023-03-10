resource "aws_s3_bucket" "resources" {
  bucket        = "${local.csi}-resources"
  acl           = "private"
  force_destroy = "true"

  # Enable versioning
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
    target_bucket = aws_s3_bucket.acc-bucketlogs.id
    target_prefix = "${local.csi}-resources/"
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-resources"
    },
  )
}

resource "aws_s3_bucket_public_access_block" "resources" {
  bucket = aws_s3_bucket.resources.id

  block_public_acls        = true
  block_public_policy      = true
  restrict_public_buckets  = true
  ignore_public_acls       = true
}
