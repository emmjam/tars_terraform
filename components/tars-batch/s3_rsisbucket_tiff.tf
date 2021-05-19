resource "aws_s3_bucket" "rsisbucket_tiff_repo" {
  count          = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  bucket        = "${local.csi_global}-rsistiffbucket"
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
    
    expiration {
      days = "0"
    }

  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-rsistiffbucket"
    },
  )
}


