module "snapshots_bucket" {
  source     = "../../modules/standard-bucket"
  log_bucket = "${aws_s3_bucket.bucketlogs.id}"
  name       = "${local.csi_global}-snapshots"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi_global}-snapshots"
    )
  )}"
}
