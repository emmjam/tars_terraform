resource "aws_iam_role" "administrators" {
  name = "${local.csi}-Administrators"

  max_session_duration = "28800"

  path = "/"

  assume_role_policy = "${data.aws_iam_policy_document.mgmt_trust.json}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-Administrators",
    ),
  )}"
}
