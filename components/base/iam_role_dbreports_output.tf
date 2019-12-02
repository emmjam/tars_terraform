resource "aws_iam_role" "dbreports_output" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "db-reports"
  )}"

  assume_role_policy = "${data.aws_iam_policy_document.dbreports_output.json}"
}

resource "aws_iam_role_policy" "dbreports_output" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "db-reports"
  )}"

  role   = "${aws_iam_role.dbreports_output.id}"
  policy = "${data.aws_iam_policy_document.dbreports_output.json}"
}