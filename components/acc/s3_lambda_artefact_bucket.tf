resource "aws_s3_bucket" "lambda_artefacts" {
  count          = contains("mgmt", var.environment) ? 0 : 1
  bucket        = "${local.csi_global}-lambda_artefacts"
  acl           = "private"
  force_destroy = "true"
  
  logging {
    target_bucket = data.terraform_remote_state.ctrl.outputs.tars_acct_bucketlogs
    target_prefix = "${local.csi}-lambda_artefacts/"
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "wholebucket"
    prefix  = "/"
    enabled = "true"
    
    expiration {
      days = 1825
    }
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-lambda_artefacts"
    },
  )
}

resource "aws_s3_bucket_public_access_block" "lambda_artefacts" {
  count                    = contains("mgmt", var.environment) ? 0 : 1
  bucket                   = aws_s3_bucket.lambda_artefacts[count.index].id
  block_public_acls        = true
  block_public_policy      = true
  restrict_public_buckets  = true
  ignore_public_acls       = true

}


data "aws_iam_policy_document" "lambda_artefacts" {
  statement {
    sid = "S3BucketAllowCrossAccount"

    actions = [
      "s3:ListBucket",
      "s3:GetObjectVersion",
      "s3:GetObject",
      "s3:GetBucketVersioning",
      "s3:GetBucketLocation",
    ]

    principals {
      type = "AWS"

      identifiers = [
         "arn:aws:iam::${data.aws_caller_identity.demo.account_id}:root", // accounts to allow access from
      ]
    }

    resources = [
      aws_s3_bucket.lambda_artefacts.arn,
      "${module.access_logs_bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "lambda_artefacts" {
  bucket = aws_s3_bucket.lambda_artefacts.id
  policy = data.aws_iam_policy_document.lambda_artefacts.json
}