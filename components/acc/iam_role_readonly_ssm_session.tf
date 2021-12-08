resource "aws_iam_role" "readonly_ssm_session" {
  name = "ReadOnlySSMSession"

  max_session_duration = "28800"

  path = "/"

  assume_role_policy = data.aws_iam_policy_document.mgmt_trust.json

  tags = merge(
    local.default_tags,
    tomap({
      "Name" = "${local.csi}/ReadOnlySSMSession",
    }),
  )
}
