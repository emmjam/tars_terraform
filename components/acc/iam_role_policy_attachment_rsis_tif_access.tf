resource "aws_iam_role_policy_attachment" "rsis_tif_access" {
  count = var.account_environment == "live" ? 1 : 0

  role       = aws_iam_role.rsis_tif_access[count.index].name
  policy_arn = aws_iam_policy.rsis_tif_access[count.index].arn
}
