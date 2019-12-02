resource "aws_iam_policy" "qaengineer" {
  name   = "qaengineer"
  path   = "/"
  policy = "${data.aws_iam_policy_document.qaengineer.json}"
}