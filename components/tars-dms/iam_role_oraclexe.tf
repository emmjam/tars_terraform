resource "aws_iam_role" "oraclexe" {
  name               = "${var.xe_role_name}"
  assume_role_policy = "${data.aws_iam_policy_document.ec2_assumerole.json}"
}
