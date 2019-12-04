resource "aws_iam_group_policy_attachment" "readonly_dvsa" {
  count      = "${length(var.readonly_dvsa_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.readonly_dvsa.name}"
  policy_arn = "${aws_iam_policy.assume_readonly_role_dvsa.arn}"
}

resource "aws_iam_group_policy_attachment" "readonly_no_secrets_dvsa" {
  count      = "${length(var.readonly_dvsa_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.readonly_dvsa.name}"
  policy_arn = "${aws_iam_policy.assume_readonly_role_dvsa.arn}"
}
