resource "aws_iam_role" "readonly_ssm_session_no_secrets" {
  name = "ReadOnlySSMSessionNoSecrets"

  max_session_duration = "28800"

  path = "/"

  assume_role_policy = data.aws_iam_policy_document.mgmt_trust.json

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/ReadOnlySSMSessionNoSecrets",
    ),
  )
}
