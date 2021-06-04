resource "aws_s3_bucket" "envis" {
  bucket = "envis.tars.dvsacloud.uk"
  acl    = "public-read"
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
  }

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-envis-frontend",
    )
  )
}

data "aws_iam_policy_document" "envis_access" {
  statement {
    sid = "AllowWhitelistAccess"
    effect = "Allow"
    actions = ["s3:GetObject"]
    resources = [
      "arn:aws:s3:::envis.tars.dvsacloud.uk/*"
    ]
    condition {
      test = "IpAddress"
      variable = "aws:SourceIp"
      values = var.whitelist
    }
    principals {
      type = "*"
      identifiers = ["*"]
    }
  }
}
