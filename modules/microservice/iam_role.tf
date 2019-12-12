resource "aws_iam_role" "main" {
  name_prefix = format("%s-%s-", local.csi, var.name)

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

