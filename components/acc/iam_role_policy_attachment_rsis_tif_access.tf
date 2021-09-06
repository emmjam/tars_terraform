resource "aws_iam_role_policy_attachment" "rsis_tif_access" {
  role       = aws_iam_role.rsis_tif_access.name
  policy_arn = aws_iam_policy.rsis_tif_access.arn
}
