# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "cpc_front_hieradata" {
  role       = "${module.cpc-front.iam_role_name}"
  policy_arn = "${data.terraform_remote_state.acc.hieradata_kms_key_user_policy_arn}"
}

resource "aws_iam_role_policy_attachment" "cpc_front_cloudwatch" {
    role       = "${module.cpc-front.iam_role_name}"
    policy_arn = "${data.terraform_remote_state.base.iam_policy_cloudwatch_arn}"
}