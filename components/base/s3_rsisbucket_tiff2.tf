resource "aws_s3_bucket" "base_rsisbucket_tiff_repo2" {
  count         = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  bucket        = "${local.csi_global}-rsistiffbucket2"
  force_destroy = "true"

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-rsistiffbucket2"
    },
  )
}

resource "aws_s3_bucket_public_access_block" "base_rsisbucket_tiff_repo2" {
  count                   = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  bucket                  = aws_s3_bucket.base_rsisbucket_tiff_repo[count.index].id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true

}

resource "aws_s3_bucket_acl" "base_rsisbucket_tiff_repo2" {
  count                   = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  bucket                  = aws_s3_bucket.base_rsisbucket_tiff_repo[count.index].id
  acl                     = "private"
}

# Enable versioning
resource "aws_s3_bucket_versioning" "base_rsisbucket_tiff_repo2" {
  count                   = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  bucket                  = aws_s3_bucket.base_rsisbucket_tiff_repo[count.index].id

  versioning_configuration {
    status                = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "base_rsisbucket_tiff_repo2" {
  count                   = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  bucket                  = aws_s3_bucket.base_rsisbucket_tiff_repo[count.index].id

  target_bucket           = data.terraform_remote_state.ctrl.outputs.tars_acct_bucketlogs
  target_prefix           = "${local.csi}-rsistiffbucket/"
}

resource "aws_s3_bucket_lifecycle_configuration" "base_rsisbucket_tiff_repo2" {
  count                 = contains(var.rsisbucket_env, var.environment) ? 1 : 0
  bucket                = aws_s3_bucket.base_rsisbucket_tiff_repo[count.index].id

  rule {
    id = "wholebucket"

    filter {
      prefix = "/"
    }

    expiration {
      days = "1825"
    }
    
    status = "Enabled"
  }
}