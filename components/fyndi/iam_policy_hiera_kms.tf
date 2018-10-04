# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "hieradata-f" {
    role       = "${module.fyndi-f.iam_role_name}"
    policy_arn = "${data.terraform_remote_state.acc.hieradata_kms_key_user_policy_arn}"
}

resource "aws_iam_role_policy_attachment" "hieradata-b" {
    role       = "${module.fyndi-b.iam_role_name}"
    policy_arn = "${data.terraform_remote_state.acc.hieradata_kms_key_user_policy_arn}"
}
