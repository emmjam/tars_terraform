resource "aws_iam_instance_profile" "oraclexe_profile" {
  name = "${local.csi}-oraclexe-role"
  role = aws_iam_role.oraclexe.name
}

