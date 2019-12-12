# Call the awsconfig module to initialise the AWS Config
# service and record all configuration changes to an S3 bucket
module "awsconfig" {
  source = "../../modules/awsconfig"

  project     = var.project
  environment = var.environment
  component   = var.component

  default_tags = local.default_tags

  aws_account_id = var.aws_account_id

  s3_bucketlogs_bucket_id = aws_s3_bucket.bucketlogs.id
}

