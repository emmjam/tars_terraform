module "cwles_cloudtrail" {
  source = "../../modules/cwles-cloudtrail"

  project     = var.project
  environment = var.environment
  component   = var.component

  aws_account_id = var.aws_account_id

  s3_bucketlogs_bucket_id = aws_s3_bucket.bucketlogs.id

  default_tags = local.default_tags
}

