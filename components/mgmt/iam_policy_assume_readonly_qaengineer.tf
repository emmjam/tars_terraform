resource "aws_iam_policy" "assume_readonly_role_qaengineer" {
  name   = "${local.csi}-assumereadonlyroleqaengineer"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_readonly_role_qaengineer.json
}
