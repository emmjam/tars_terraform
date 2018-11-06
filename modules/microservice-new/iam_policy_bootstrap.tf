resource "aws_iam_policy" "bootstrap" {
  count = "${var.lifecycle_hook_launching_enabled}"

  name_prefix = "${format(
    "%s-%s-%s-",
    local.csi,
    var.name,
    "bootstrap"
  )}"

  path   = "/"
  policy = "${data.aws_iam_policy_document.bootstrap.json}"
}

resource "aws_iam_role_policy_attachment" "bootstrap" {
  count      = "${var.lifecycle_hook_launching_enabled}"
  role       = "${aws_iam_role.main.name}"
  policy_arn = "${aws_iam_policy.bootstrap.arn}"
}
