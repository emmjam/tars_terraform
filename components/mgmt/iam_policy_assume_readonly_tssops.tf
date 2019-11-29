resource "aws_iam_policy" "assume_readonly_role_tssops" {
  name   = "${local.csi}-assumereadonlyroletssops"
  path   = "/"
  policy = "${data.aws_iam_policy_document.assume_readonly_role_tssops.json}"
}