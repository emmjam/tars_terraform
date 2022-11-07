resource "aws_s3_bucket" "inspector_reports" {
  count         = var.kms_inspector_count
  bucket        = "${local.csi_global}-inspector-reports"
  force_destroy = "true"

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi_global}-inspector_reports"
    },
  )
}

resource "aws_s3_bucket_public_access_block" "inspector_reports" {
  count                   = var.kms_inspector_count
  bucket                  = aws_s3_bucket.inspector_reports[count.index].id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true

}

data "aws_iam_policy_document" "inspector_reports" {
  count = var.kms_inspector_count
  statement {
    sid    = "1"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["inspector2.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:AbortMultipartUpload",
    ]

    resources = [
      aws_s3_bucket.inspector_reports[0].arn,
      "${aws_s3_bucket.inspector_reports[0].arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "inspector_reports" {
  count  = var.kms_inspector_count
  bucket = aws_s3_bucket.inspector_reports[0].id
  policy = data.aws_iam_policy_document.inspector_reports[0].json
}

resource "aws_s3_bucket_acl" "inspector_reports" {
  count  = var.kms_inspector_count
  bucket = aws_s3_bucket.inspector_reports[count.index].id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "inspector_reports" {
  count  = var.kms_inspector_count
  bucket = aws_s3_bucket.inspector_reports[count.index].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_logging" "inspector_reports" {
  count         = var.kms_inspector_count
  bucket        = aws_s3_bucket.inspector_reports[count.index].id

  target_bucket = aws_s3_bucket.acc-bucketlogs.id
  target_prefix = "${local.csi}-inspector-reports/"
}

resource "aws_s3_bucket_versioning" "inspector_reports" {
  count    = var.kms_inspector_count
  bucket   = aws_s3_bucket.inspector_reports[count.index].id

  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "inspector_reports" {
  count  = var.kms_inspector_count
  bucket = aws_s3_bucket.inspector_reports[count.index].id

  rule {
    id = "wholebucket"

    filter {
      prefix = "/"
    }

    expiration {
      days = 1825
    }

    status = "Enabled"
  }
}