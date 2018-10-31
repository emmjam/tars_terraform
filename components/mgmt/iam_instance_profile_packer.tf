resource "aws_iam_instance_profile" "packer" {
  name = "${local.csi}-packer"
  role = "${aws_iam_role.packer.name}"
}
