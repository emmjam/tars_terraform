resource "aws_s3_bucket" "dbreports_output" {
  bucket = "${local.csi_global}-dbreports-output"
  tags = merge(
    local.default_tags,
    tomap({
      "Name" = "${local.csi_global}-dbreports-output"
    })
  )

  force_destroy = "false"
}

# provider resource updates
resource "aws_s3_bucket_logging" "dbreports_output" {
  bucket = aws_s3_bucket.dbreports_output.id

  target_bucket = aws_s3_bucket.bucketlogs.id
  target_prefix = "${local.csi_global}-dbreports-output/"
}

resource "aws_s3_bucket_versioning" "dbreports_output" {
  bucket = aws_s3_bucket.dbreports_output.id
  versioning_configuration {
    status = "Enabled"
  }
}


# Rotate logs out to cheaper storage
# Delete after 2 years
resource "aws_s3_bucket_lifecycle_configuration" "dbreports_output" {
  bucket = aws_s3_bucket.dbreports_output.id

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
      days = "1825"
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
      noncurrent_days = "1825"
    }

    status = "Enabled"
  }
}


resource "aws_sns_topic" "dbretention" {
  count = contains(var.efs_dbretention_env, var.environment) ? 1 : 0
  name  = "s3-notification-${var.environment}-dbretention"

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[{
        "Effect": "Allow",
        "Principal": {"AWS":"*"},
        "Action": "SNS:Publish",
        "Resource": "arn:aws:sns:*:*:s3-notification-${var.environment}-dbretention",
        "Condition":{
            "ArnLike":{"aws:SourceArn":"${aws_s3_bucket.dbreports_output.arn}"}
        }
    }]
}
POLICY
}

resource "aws_s3_bucket_notification" "dbreports_output" {
  count  = contains(var.efs_dbretention_env, var.environment) ? 1 : 0
  bucket = aws_s3_bucket.dbreports_output.id

  topic {
    topic_arn     = aws_sns_topic.dbretention[count.index].id
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".log"
  }
}


resource "aws_s3_bucket_public_access_block" "dbreports_output" {
  bucket                  = aws_s3_bucket.dbreports_output.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

