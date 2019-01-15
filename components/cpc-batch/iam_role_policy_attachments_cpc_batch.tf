resource "aws_iam_role_policy_attachment" "hieradata" {
  role       = "${module.cpc_batch.iam_role_name}"
  policy_arn = "${data.terraform_remote_state.acc.hieradata_kms_key_user_policy_arn}"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_tars_core" {
  role       = "${module.cpc_batch.iam_role_name}"
  policy_arn = "${data.terraform_remote_state.base.iam_policy_cloudwatch_arn}"
}