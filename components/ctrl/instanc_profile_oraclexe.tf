resource "aws_iam_instance_profile" "oraclexe_profile" {
  count = var.account_environment != "mgmt" ? 1 : 0
  name  = "${local.csi}-oraclexe-role"
  role  = aws_iam_role.oraclexe[count.index].name
}

