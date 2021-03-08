resource "aws_s3_bucket" "rsisbucket_tiff_repo2" {
  count          = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  bucket        = "${local.csi_global}-rsistiffbucket2"
  acl           = "private"
  force_destroy = "true"

  # Enable versioning
  versioning {
    enabled = false
  }

  lifecycle_rule {
    id      = "wholebucket"
    prefix  = "/"
    enabled = "true"

  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-rsistiffbucket2"
    },
  )
}
