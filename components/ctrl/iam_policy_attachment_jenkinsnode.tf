# TODO: peacheym: Replace with aws_iam_role_policy_attachment
resource "aws_iam_policy_attachment" "jenkinsnode" {
  name       = "${local.csi}-jenkinsnode"
  policy_arn = "${aws_iam_policy.jenkinsnode.arn}"

  roles = [
    "${module.jenkinsnode.iam_role_name}",
  ]
}
