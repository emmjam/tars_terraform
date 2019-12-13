module "access_logs_bucket" {
  source = "../../modules/standard-bucket"

  name       = "${local.csi_global}-access_logs"
  log_bucket = aws_s3_bucket.bucketlogs.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-access_logs"
    },
  )
}

