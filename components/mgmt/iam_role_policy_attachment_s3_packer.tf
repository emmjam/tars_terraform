resource "aws_iam_role_policy_attachment" "s3-packer" {
  role       = "${aws_iam_role.packer.name}"
  policy_arn = "${aws_iam_policy.s3-packer.arn}"
}
