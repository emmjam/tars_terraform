module "lambda_platform_bucket" {
  source     = "../../modules/standard-bucket"
  log_bucket = aws_s3_bucket.bucketlogs.id
  name       = "${local.csi_global}-lambda-platform"

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-lambda-platform"
    },
  )
}

