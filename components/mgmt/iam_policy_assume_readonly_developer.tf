resource "aws_iam_policy" "assume_readonly_role_developer" {
  name   = "${local.csi}-assumereadonlyroledeveloper"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_readonly_role_developer.json
}
