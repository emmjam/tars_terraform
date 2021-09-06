resource "aws_iam_role" "jenkins_admin" {
  name = "jenkins-admin"

  max_session_duration = "28800"

  path = "/"

  assume_role_policy = data.aws_iam_policy_document.jenkins_trust.json

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/jenkins-admin",
    ),
  )
}
