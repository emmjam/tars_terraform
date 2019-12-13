resource "aws_s3_bucket" "holding_pages" {
  bucket = "${local.csi_global}-holding-pages"
  tags   = local.default_tags

  website {
    index_document = "index.html"
  }
}

