resource "aws_iam_role" "lambda_holding_pages" {
  name               = "${local.csi}-lambda-holding-pages"
  assume_role_policy = "${data.aws_iam_policy_document.lambda_holding_pages_assumerole.json}"

  tags = "${merge(
   local.default_tags,
    map(
      "Name", "${local.csi}/${var.module}",
    ),
  )}"
}

resource "aws_iam_role_policy_attachment" "holding_pages_policy" {
  role       = "${aws_iam_role.lambda_holding_pages.name}"
  policy_arn = "${aws_iam_policy.lambda_holding_pages.arn}"
}
