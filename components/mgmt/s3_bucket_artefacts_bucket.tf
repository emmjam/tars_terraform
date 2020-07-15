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

data "aws_iam_policy_document" "artefacts" {
  statement {
    sid = "AllAccountsArtefactList"

    resources = [
      aws_s3_bucket.artefacts.arn,
    ]

    actions = [
      "s3:ListBucket",
    ]

    principals {
      type = "AWS"

      identifiers = var.aws_account_ids
    }
  }

  statement {
    sid = "AllAccountsArtefactRead"

    resources = [
      "${aws_s3_bucket.artefacts.arn}/*",
    ]

    actions = [
      "s3:GetObject",
    ]

    principals {
      type = "AWS"

      identifiers = var.aws_account_ids
    }
  }
}

resource "aws_s3_bucket_policy" "artefacts" {
  bucket = aws_s3_bucket.artefacts.id
  policy = data.aws_iam_policy_document.artefacts.json
}
