resource "aws_iam_role" "ops" {
  name     = "${local.csi}-ops"

  max_session_duration = "28800"

  assume_role_policy = "${data.aws_iam_policy_document.iam_users_assumerole.json}"
}

resource "aws_iam_role_policy_attachment" "ops-attach-admin" {
  role       = "${aws_iam_role.ops.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
