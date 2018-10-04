module "artefacts_bucket" {
  source = "../../modules/standard-bucket"

  log_bucket = "${aws_s3_bucket.bucketlogs.id}"

  name = "${format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.aws_account_id,
    data.aws_region.current.name,
    var.environment,
    var.component,
    "artefacts"
  )}"

  tags = "${merge(
    "${var.default_tags}",
    map(
      "Name", format(
        "%s-%s-%s-%s-%s-%s-logs",
        var.project,
        var.aws_account_id,
        data.aws_region.current.name,
        var.environment,
        var.component,
        "artefacts" 
      ),
    )
  )}"
}

