resource "aws_iam_policy" "readonly_ssm_session_no_secrets" {
  name   = "ReadOnlySSMSessionNoSecrets"
  path   = "/"
  policy = "${data.aws_iam_policy_document.readonly_ssm_session_no_secrets.json}"
}
