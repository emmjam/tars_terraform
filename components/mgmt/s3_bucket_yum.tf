# Global yum repository
resource "aws_s3_bucket" "yum" {
  bucket = "${local.csi_global}-yum"
  acl    = "private"

  # As a general rule, standard operational S3 buckets should have force_destroy = true
  # There are two reasons why this is not the case for this bucket, albeit borderline:
  #  * The bucket will contain critical build data that should not be deleted unless by an appointed person
  #  * The bucket is versioned and therefore in any case cannot be deleted unless non-current objects
  #    are deleted from the AWS Console.
  # These reasons are not exclusive reasons why any bucket should have force_destroy disabled
  # but are valid for this bucket. It still stands that the default position should be that is is enabled
  force_destroy = "false"

  versioning {
    enabled = "true"
  }

  # Enable S3 Bucket Logging to the bucketlogs bucket
  logging {
    target_bucket = aws_s3_bucket.bucketlogs.id
    target_prefix = "${local.csi_global}-yum/"
  }

  # Rotate out to cheaper storage
  # Delete after 2 years
  lifecycle_rule {
    id      = "wholebucket"
    prefix  = ""
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

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-yum"
    },
  )
}

