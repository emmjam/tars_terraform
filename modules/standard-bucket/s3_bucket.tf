# A generic standard private S3 bucket with versioning,
# logging and lifecycle management
resource "aws_s3_bucket" "standard" {
  bucket        = replace(var.name, "_", "")
  force_destroy = var.force_destroy

  tags = merge(
    var.tags,
    {
      "Name" = replace(var.name, "_", "")
    },
  )
}

# provider updates
resource "aws_s3_bucket_acl" "standard" {
  bucket = aws_s3_bucket.standard.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "standard" {
  bucket = aws_s3_bucket.standard.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Rotate logs out to cheaper storage
# Delete after 2 years
resource "aws_s3_bucket_lifecycle_configuration" "standard" {
  bucket = aws_s3_bucket.standard.id

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

    noncurrent_version_expiration {
      noncurrent_days = "732"
    }

    status = "Enabled"
  }
}

# Enable Logging to Self
resource "aws_s3_bucket_logging" "standard" {
  bucket = aws_s3_bucket.standard.id

  target_bucket = var.log_bucket
  target_prefix = "${replace(var.name, "_", "")}/"
}