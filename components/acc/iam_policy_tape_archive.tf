resource "aws_iam_policy" "legacy-tape-archive-upload" {
  name        = "${local.csi}-legacy-tape-archive-upload"
  description = "IAM Policy for ${local.csi}-legacy-tape-archive-upload"
  policy      = data.aws_iam_policy_document.legacy-tape-archive-upload.json
}

resource "aws_iam_policy" "legacy-tape-archive-access" {
  name        = "${local.csi}-legacy-tape-archive-access"
  description = "IAM Policy for ${local.csi}-legacy-tape-archive-access"
  policy      = data.aws_iam_policy_document.legacy-tape-archive-access.json
}

