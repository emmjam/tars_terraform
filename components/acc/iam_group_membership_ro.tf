resource "aws_iam_group_membership" "support_ro_users" {
  count = "${length(var.support_ro_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.support_ro_users.name}"
  group = "${aws_iam_group.support_ro_users.name}"

  users = [
    "${var.support_ro_users}",
  ]
}

resource "aws_iam_group_membership" "tss_billing_ro_users" {
  count = "${length(var.tss_billing_ro_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.tss_billing_ro_users.name}"
  group = "${aws_iam_group.tss_billing_ro_users.name}"

  users = [
    "${var.tss_billing_ro_users}",
  ]
}

resource "aws_iam_group_membership" "db_cw_ro_users" {
  count = "${length(var.db_cw_ro_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.db_cw_ro_users.name}"
  group = "${aws_iam_group.db_cw_ro_users.name}"

  users = [
    "${var.db_cw_ro_users}",
  ]
}
