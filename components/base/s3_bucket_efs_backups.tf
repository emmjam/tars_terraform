resource "aws_s3_bucket" "efs_backups" {
  bucket        = "${local.csi_global}-efs-backups"
  acl           = "private"
  force_destroy = "true"

  # Enable versioning
  versioning {
    enabled = true
  }

  logging {
    target_bucket = "${aws_s3_bucket.bucketlogs.id}"
    target_prefix = "${local.csi_global}-efs-backups/"
  }

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi_global}-efs-backups"
    )
  )}"
}
