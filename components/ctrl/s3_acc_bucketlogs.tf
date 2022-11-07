resource "aws_s3_bucket" "acc-bucketlogs" {
  bucket        = "${local.csi}-acc-bucketlogs"
  #acl           = "log-delivery-write"
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
  }*/


  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-acc-bucketlogs"
    },
  )
}

resource "aws_s3_bucket_public_access_block" "acc-bucketlogs" {
  bucket = aws_s3_bucket.acc-bucketlogs.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true

}

resource "aws_s3_bucket_acl" "acc-bucketlogs" {
  bucket = aws_s3_bucket.acc-bucketlogs.id
  acl    = "log-delivery-write"
}


# Enable versioning
resource "aws_s3_bucket_versioning" "acc-bucketlogs" {
  bucket = aws_s3_bucket.acc-bucketlogs.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

# Rotate out older files to cheaper storage
resource "aws_s3_bucket_lifecycle_configuration" "acc-bucketlogs" {
  bucket = aws_s3_bucket.acc-bucketlogs.id

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