resource "aws_iam_policy" "ses_keys_rotate" {
  count       = var.account_environment != "mgmt" ? 1 : 0
  name        = "${local.csi}-ses-keys-rotate"
  description = "IAM policy for ${local.csi}-ses-keys-rotate"
  policy      = data.aws_iam_policy_document.ses_keys_rotate[count.index].json
}

