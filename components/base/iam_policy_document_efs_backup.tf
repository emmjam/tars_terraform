data "aws_iam_policy_document" "efs_backup" {
  statement {
    sid    = "AllowEFSBackupS3Access"
    effect = "Allow"

    actions = [
      "s3:*"
    ]

    resources = [
      "${aws_s3_bucket.efs_backups.arn}",
    ]
  }
}

resource "aws_iam_policy" "efs_backup" {
  name        = "${local.csi}-efs-backup"
  description = "IAM policy for ${local.csi}-efs-backup"
  policy      = "${data.aws_iam_policy_document.efs_backup.json}"
}
