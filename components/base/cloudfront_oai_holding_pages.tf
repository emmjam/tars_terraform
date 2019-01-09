resource "aws_cloudfront_origin_access_identity" "holding_pages" {
  comment = "${local.csi} - OAI for holding_pages"
}