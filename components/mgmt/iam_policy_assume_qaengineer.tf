resource "aws_iam_policy" "assume_qaengineer_role" {
  name   = "${local.csi}-assumeqaengineerrole"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_qaengineer_role.json
}
