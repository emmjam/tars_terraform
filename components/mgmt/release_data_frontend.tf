resource "aws_s3_bucket" "envis" {
  bucket = "envis.tars.dvsacloud.uk"
  /*acl    = "private"
  policy = data.aws_iam_policy_document.envis_access.json

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  logging {
    target_bucket = "${local.csi_global}-bucketlogs"
    target_prefix = "${local.csi_global}-envis-frontend"
  }

  versioning {
    enabled = true
  }*/

  tags = merge(
    local.default_tags,
    tomap({
      "Name" = "${local.csi}-envis-frontend",
    })
  )
}

data "aws_iam_policy_document" "envis_access" {
  statement {
    sid     = "AllowWhitelistAccess"
    effect  = "Allow"
    actions = ["s3:GetObject"]
    resources = [
      "arn:aws:s3:::envis.tars.dvsacloud.uk/*"
    ]
    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"
      values   = var.whitelist
    }
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_acl" "envis" {
  bucket = aws_s3_bucket.envis.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "envis" {
  bucket = aws_s3_bucket.envis.id
  policy = data.aws_iam_policy_document.envis_access.json
}

resource "aws_s3_bucket_website_configuration" "envis" {
  bucket = aws_s3_bucket.envis.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_logging" "envis" {
  bucket = aws_s3_bucket.envis.id

  target_bucket = aws_s3_bucket.bucketlogs.id
  target_prefix = "${local.csi_global}-envis-frontend"
}

# Enable versioning
resource "aws_s3_bucket_versioning" "envis" {
  bucket = aws_s3_bucket.envis.id
  
  versioning_configuration {
    status = "Enabled"
  }
}


