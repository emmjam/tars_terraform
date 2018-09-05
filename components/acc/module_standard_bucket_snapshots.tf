module "snapshots_bucket" {
  source = "../../modules/standard-bucket"

  log_bucket = "${aws_s3_bucket.bucketlogs.id}"

  name = "${format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.aws_account_id,
    var.aws_region,
    var.environment,
    var.component,
    "snapshots"
  )}"

  tags = "${merge(
    "${var.default_tags}",
    map(
      "Name", format(
        "%s-%s-%s-%s-%s-%s-logs",
        var.project,
        var.aws_account_id,
        var.aws_region,
        var.environment,
        var.component,
        "snapshots" 
      ),
    )
  )}"
}

