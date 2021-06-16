resource "aws_iam_policy" "rsis_tif_access" {
  name   = "rsis_tif_access"
  path   = "/"
  policy = "${data.aws_iam_policy_document.rsis_tif_access.json}"
}
