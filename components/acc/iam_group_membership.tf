resource "aws_iam_group_membership" "all_users" {
  name  = "${aws_iam_group.all_users.name}"
  group = "${aws_iam_group.all_users.name}"

  users = [
    "${var.all_users}",
  ]
}

resource "aws_iam_group_membership" "administrators" {
  name  = "${aws_iam_group.administrators.name}"
  group = "${aws_iam_group.administrators.name}"

  users = [
    "${var.administrators}",
  ]
}

resource "aws_iam_group_membership" "power_users" {
  count = "${length(var.power_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.power_users.name}"
  group = "${aws_iam_group.power_users.name}"

  users = [
    "${var.power_users}",
  ]
}

resource "aws_iam_group_membership" "ops_users" {
  count = "${length(var.ops_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.ops.name}"
  group = "${aws_iam_group.ops.name}"

  users = [
    "${var.ops_users}",
  ]
}
