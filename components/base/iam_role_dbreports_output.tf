data "aws_iam_policy_document" "dbreports_output_assume_role" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "dbreports_output" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "db-reports"
  )}"

  assume_role_policy = "${data.aws_iam_policy_document.dbreports_output_assume_role.json}"
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