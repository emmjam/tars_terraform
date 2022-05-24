module "access_logs_bucket" {
  source = "../../modules/standard-bucket"
  count  = var.reporting_xe_count

  name          = "${local.csi_global}-reporting-xe-accesslogs"
  log_bucket    = aws_s3_bucket.bucketlogs.id
  force_destroy = true

  tags = merge(
    local.default_tags,
    { "Name" = "${local.csi_global}-reporting-xe-accesslogs" },
  )
}
