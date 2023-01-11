resource "aws_iam_policy" "rsis_tif_access" {
  count = var.account_environment == "live" ? 1 : 0

  name   = "rsis_tif_access"
  path   = "/"
  policy = data.aws_iam_policy_document.rsis_tif_access[count.index].json
}
