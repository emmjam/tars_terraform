resource "aws_iam_policy" "readonly_no_secrets" {
  name   = "ReadOnlyNoSecrets"
  path   = "/"
  policy = data.aws_iam_policy_document.readonly_no_secrets.json
}
