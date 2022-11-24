resource "aws_s3_bucket" "artefacts" {
  bucket = "${local.csi_global}-artefacts"

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

resource "aws_s3_bucket_acl" "artefacts" {
  bucket = aws_s3_bucket.artefacts.id
  acl    = "private"
}


resource "aws_s3_bucket_logging" "artefacts" {
  bucket = aws_s3_bucket.artefacts.id

  target_bucket = aws_s3_bucket.bucketlogs.id # check this is the right bucket
  target_prefix = "${local.csi_global}-artefacts"
}

resource "aws_s3_bucket_versioning" "artefacts" {
  bucket = aws_s3_bucket.artefacts.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "artefacts" {
  bucket = aws_s3_bucket.artefacts.id

  rule {
    id = "wars_file_90_days_rentention"

    filter {
      prefix = "release-candidates/applications/"
    }

    expiration {
      days = 90
    }

    status = "Enabled"
  }
}