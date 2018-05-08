resource "aws_iam_role" "lambda_curator" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "lambda",
    "curator"
  )}"

  assume_role_policy = "${data.aws_iam_policy_document.lambda_assumerole.json}"
}

resource "aws_iam_role_policy" "lambda_curator" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "lambda",
    "curator"
  )}"

  role   = "${aws_iam_role.lambda_curator.id}"
  policy = "${data.aws_iam_policy_document.lambda_curator.json}"
}
