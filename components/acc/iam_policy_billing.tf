resource "aws_iam_policy" "billing" {
  name   = "billing"
  path   = "/"
  policy = "${data.aws_iam_policy_document.billing.json}"
}