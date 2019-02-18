resource "aws_iam_role" "ops" {
  name     = "${local.csi}-ops"

  assume_role_policy = "${data.aws_iam_policy_document.iam_users_assumerole.json}"
}