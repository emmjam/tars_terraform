resource "aws_iam_policy" "enable_dms" {
  name   = "${local.csi}-dms-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.enable_dms.json}"
}
