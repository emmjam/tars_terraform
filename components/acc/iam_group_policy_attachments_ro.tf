resource "aws_iam_group_policy_attachment" "support_ro_users" {
  count      = "${length(var.support_ro_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.support_ro_users.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "support_ro_users_enforce_mfa" {
  count      = "${length(var.support_ro_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.support_ro_users.name}"
  policy_arn = "${aws_iam_policy.enforce_mfa.arn}"
}

resource "aws_iam_group_policy_attachment" "tss_billing_ro_users" {
  count      = "${length(var.tss_billing_ro_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.tss_billing_ro_users.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "tss_billing_ro_users_enforce_mfa" {
  count      = "${length(var.tss_billing_ro_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.tss_billing_ro_users.name}"
  policy_arn = "${aws_iam_policy.enforce_mfa.arn}"
}

resource "aws_iam_group_policy_attachment" "tss_billing_ro_users_billing_ro" {
  count      = "${length(var.tss_billing_ro_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.tss_billing_ro_users.name}"
  policy_arn = "${aws_iam_policy.billing_ro_users.arn}"
}

resource "aws_iam_group_policy_attachment" "db_cw_ro_users_cw_ro" {
  count      = "${length(var.db_cw_ro_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.db_cw_ro_users.name}"
  policy_arn = "${aws_iam_policy.cw_ro_users.arn}"
}