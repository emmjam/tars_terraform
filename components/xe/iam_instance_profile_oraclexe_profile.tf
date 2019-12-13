resource "aws_iam_instance_profile" "oraclexe_profile" {
  name = "${local.csi}-role"
  role = aws_iam_role.oraclexe.name
}

