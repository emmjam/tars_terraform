resource "aws_iam_policy" "enforce_mfa" {
  name   = "enforce_mfa"
  path   = "/"
  policy = data.aws_iam_policy_document.enforce_mfa.json
}

