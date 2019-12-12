resource "aws_iam_instance_profile" "main" {
  name_prefix = format("%s-%s-", local.csi, var.name)

  role = aws_iam_role.main.name
}

