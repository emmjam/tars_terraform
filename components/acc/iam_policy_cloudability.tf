resource "aws_iam_policy" "cloudability" {
  name   = "${local.csi}-cloudability"
  path   = "/"
  policy = "${data.aws_iam_policy_document.cloudability.json}"
}