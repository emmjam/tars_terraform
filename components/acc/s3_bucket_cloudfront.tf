resource "aws_s3_bucket" "driverpracticaltest-dvsa-gov-uk-apology" {
  count = var.cloudfront_enabled
  bucket = "${local.csi_global}-apology-page"
  website {
    index_document = "index.html"
  }
  versioning {
    enabled = true
  }
  logging {
    target_bucket = aws_s3_bucket.bucketlogs.id
    target_prefix = "${local.csi_global}-apology-page/"
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
