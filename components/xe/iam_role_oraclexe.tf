resource "aws_iam_role" "oraclexe" {
  name               = "${local.csi}-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assumerole.json
}

