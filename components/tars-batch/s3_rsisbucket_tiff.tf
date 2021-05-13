resource "aws_s3_bucket" "rsisbucket_tiff_repo" {
  count          = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  bucket        = "${local.csi_global}-rsistiffbucket"
  acl           = "private"
  force_destroy = "true"
  
  logging {
    target_bucket = data.terraform_remote_state.ctrl.outputs.tars_acct_bucketlogs
    target_prefix = "${local.csi}-rsistiffbucket/"
  }

  versioning {
    enabled = true
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

resource "aws_s3_bucket_public_access_block" "rsisbucket_tiff_repo" {
  count                    = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  bucket                   = aws_s3_bucket.rsisbucket_tiff_repo[count.index].id
  block_public_acls        = true
  block_public_policy      = true
  restrict_public_buckets  = true
  ignore_public_acls       = true

}
