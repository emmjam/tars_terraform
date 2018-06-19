resource "aws_iam_role_policy_attachment" "jmeter_hieradata" {
  role       = "${module.microservice_jmeter.iam_role_name}"
  policy_arn = "${data.terraform_remote_state.acc.hieradata_kms_key_user_policy_arn}"
}
