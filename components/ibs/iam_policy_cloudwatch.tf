resource "aws_iam_role_policy_attachment" "cloudwatch" {
  role       = "${module.ibs.iam_role_name}"
  policy_arn = "${data.terraform_remote_state.base.iam_policy_cloudwatch_arn}"
}
