resource "aws_s3_bucket" "holding_pages" {
  bucket = "${local.csi_global}-holding-pages"
  tags   = local.default_tags
}

resource "aws_s3_bucket_public_access_block" "holding_pages" {
  bucket                  = aws_s3_bucket.holding_pages.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# provider resource updates
resource "aws_s3_bucket_website_configuration" "holding_pages" {
  bucket = aws_s3_bucket.holding_pages.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_logging" "holding_pages" {
  bucket = aws_s3_bucket.holding_pages.id

  target_bucket = aws_s3_bucket.bucketlogs.id
  target_prefix = "${local.csi_global}-holding-pages/"
}

resource "aws_s3_bucket_versioning" "holding_pages" {
  bucket = aws_s3_bucket.holding_pages.id
  versioning_configuration {
    status = "Enabled"
  }
}