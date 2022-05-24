resource "aws_s3_bucket" "holding_pages" {
  bucket = "${local.csi_global}-holding-pages"
  tags   = local.default_tags

  website {
    index_document = "index.html"
  }
  logging {
    target_bucket = aws_s3_bucket.bucketlogs.id
    target_prefix = "${local.csi_global}-holding-pages/"
  }
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "holding_pages" {
  bucket                  = aws_s3_bucket.holding_pages.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

