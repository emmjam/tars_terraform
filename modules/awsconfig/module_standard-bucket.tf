# The AWS S3 Bucket used as a target for the AWS Config
# Configuration Recorder Delivery Channel for writing
# AWS config output
module "standard_bucket" {
  source = "../../modules/standard-bucket"

  log_bucket = "${var.s3_bucketlogs_bucket_id}"

  name = "${format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.aws_account_id,
    data.aws_region.current.name,
    var.environment,
    var.component,
    var.module
  )}"

  tags = "${merge(
    "${var.default_tags}",
    map(
      "Name", format(
        "%s-%s-%s-%s-%s-%s",
        var.project,
        var.aws_account_id,
        data.aws_region.current.name,
        var.environment,
        var.component,
        var.module 
      ),
      "Module", var.module
    )
  )}"
}
