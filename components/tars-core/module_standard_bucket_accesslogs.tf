module "access_logs_bucket" {
  source = "../../modules/standard-bucket"

  log_bucket = aws_s3_bucket.bucketlogs.id

  name = "${local.csi_global}-access_logs"

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-access_logs"
    },
  )
}

