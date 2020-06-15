resource "aws_s3_bucket" "artefacts" {
  bucket     = "${local.csi_global}-artefacts"
  acl        = "private"

  logging {
    target_bucket = "${local.csi_global}-bucketlogs"
    target_prefix = "${local.csi_global}-artefacts"
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "wars_file_90_days_rentention"
    prefix  = "release-candidates/applications/"
    enabled = true

    expiration {
      days = 90
    }
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-artefacts"
    },
  )
}
