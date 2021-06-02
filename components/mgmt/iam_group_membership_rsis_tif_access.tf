resource "aws_iam_group_membership" "rsis_tif_access" {
  count = length(var.rsis_tif_access_users) == 0 ? 0 : 1
  name  = aws_iam_group.rsis_tif_access.name
  group = aws_iam_group.rsis_tif_access.name

  users = var.rsis_tif_access_users
}
