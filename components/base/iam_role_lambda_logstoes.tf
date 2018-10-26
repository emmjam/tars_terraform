resource "aws_iam_role" "lambda_logstoes" {
  name                = "${local.csi}-lambda-logstoes"
  assume_role_policy  = "${data.aws_iam_policy_document.lambda_assumerole.json}"
}

resource "aws_iam_role_policy" "lambda_logstoes" {
  name    = "${local.csi}-lambda-logstoes"
  role    = "${aws_iam_role.lambda_logstoes.id}"
  policy  = "${data.aws_iam_policy_document.lambda_logstoes.json}"
}
