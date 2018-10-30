resource "aws_iam_instance_profile" "oraclexe_profile" {
  name = "${var.xe_role_name}"
  role = "${aws_iam_role.oraclexe.name}"
}
