resource "aws_iam_group_policy_attachment" "rsis_tif_access" {
  group      = aws_iam_group.rsis_tif_access.name
  policy_arn = aws_iam_policy.assume_rsis_tif_access_role.arn
}
