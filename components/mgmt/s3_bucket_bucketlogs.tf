# A generic standard private S3 bucket with versioning,
# logging and lifecycle management to be used as a target
# for logs for any other bucket created by this component
# or any module called by this component
resource "aws_s3_bucket" "bucketlogs" {
  bucket        = "${local.csi_global}-bucketlogs"
  #acl           = "log-delivery-write"
  force_destroy = "true"

  /* # Enable versioning - removed due to provider update
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
  }*/

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-bucketlogs"
    },
  )
}

resource "aws_s3_bucket_acl" "bucketlogs" {
  bucket = aws_s3_bucket.bucketlogs.id
  acl    = "log-delivery-write"
}


# Enable versioning
resource "aws_s3_bucket_versioning" "bucketlogs" {
  bucket = aws_s3_bucket.bucketlogs.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "bucketlogs" {
  bucket = aws_s3_bucket.envis.id

  target_bucket = aws_s3_bucket.bucketlogs.id
  target_prefix = "${local.csi_global}-bucketlogs/"
}

resource "aws_s3_bucket_lifecycle_configuration" "bucketlogs" {
  bucket = aws_s3_bucket.bucketlogs.id

  rule {
    id = "wholebucket"

    filter {
      prefix = "/"
    }

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
      noncurrent_days = 30
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
