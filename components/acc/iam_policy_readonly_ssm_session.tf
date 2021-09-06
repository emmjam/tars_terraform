resource "aws_iam_policy" "readonly_ssm_session" {
  name   = "ReadOnlySSMSession"
  path   = "/"
  policy = data.aws_iam_policy_document.readonly_ssm_session.json
}
