resource "aws_iam_role" "billing" {
  name = "Billing"

  max_session_duration = "28800"

  path = "/"

  assume_role_policy = data.aws_iam_policy_document.mgmt_trust.json

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/Billing",
    ),
  )
}
