resource "aws_iam_role" "oraclexe" {
  count              = var.account_environment != "mgmt" ? 1 : 0
  name               = "${local.csi}-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assumerole.json
}
