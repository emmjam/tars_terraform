resource "aws_iam_role_policy_attachment" "cloudwatch-f" {
    role       = "${module.fyndi-f.iam_role_name}"
    policy_arn = "${data.terraform_remote_state.base.iam_policy_cloudwatch_arn}"
}

resource "aws_iam_role_policy_attachment" "cloudwatch-b" {
    role       = "${module.fyndi-b.iam_role_name}"
    policy_arn = "${data.terraform_remote_state.base.iam_policy_cloudwatch_arn}"
}
