resource "aws_s3_bucket" "driverpracticaltest-dvsa-gov-uk-apology" {
  count  = var.cloudfront_enabled
  bucket = "${local.csi_global}-apology-page"
}

resource "aws_s3_bucket_website_configuration" "driverpracticaltest-dvsa-gov-uk-apology" {
  count  = var.cloudfront_enabled
  bucket = aws_s3_bucket.driverpracticaltest-dvsa-gov-uk-apology[count.index].bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_versioning" "driverpracticaltest-dvsa-gov-uk-apology" {
  count  = var.cloudfront_enabled
  bucket = aws_s3_bucket.driverpracticaltest-dvsa-gov-uk-apology[count.index].id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "driverpracticaltest-dvsa-gov-uk-apology" {
  count  = var.cloudfront_enabled
  bucket = aws_s3_bucket.driverpracticaltest-dvsa-gov-uk-apology[count.index].id

  target_bucket = aws_s3_bucket.bucketlogs.id
  target_prefix = "${local.csi_global}-apology-page/"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "driverpracticaltest-dvsa-gov-uk-apology" {
  count  = var.cloudfront_enabled
  bucket = aws_s3_bucket.driverpracticaltest-dvsa-gov-uk-apology[count.index].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}
