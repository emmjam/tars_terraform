resource "aws_iam_policy" "assume_rsis_tif_access_role" {
  name   = "${local.csi}-assumersis_tif_access"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_rsis_tif_access_role.json
}
