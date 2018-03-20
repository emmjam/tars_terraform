resource "aws_iam_instance_profile" "packer" {
  name = "${format(
     "%s-%s-%s-%s",
     var.project,
     var.environment,
     var.component,
     "packer"
   )}"

  role = "${aws_iam_role.packer.name}"
}

resource "aws_iam_role" "packer" {
  name = "${format(
     "%s-%s-%s-%s",
     var.project,
     var.environment,
     var.component,
     "packer"
   )}"

  description        = "Allows EC2 instances to call AWS services on your behalf."
  assume_role_policy = "${data.aws_iam_policy_document.ec2_assumerole.json}"
}

resource "aws_iam_role_policy_attachment" "packer_hieradata" {
  role       = "${aws_iam_role.packer.name}"
  policy_arn = "${module.kms_hieradata.user_policy_arn}"
}

resource "aws_iam_policy" "s3-packer" {
  name        = "${var.project}-${var.environment}-${var.component}-s3-packer"
  description = "IAM policy for ${var.project}-${var.environment}-${var.component}-s3-packer"
  policy      = "${data.aws_iam_policy_document.s3-packer.json}"
}

resource "aws_iam_role_policy_attachment" "s3-packer" {
  role       = "${aws_iam_role.packer.name}"
  policy_arn = "${aws_iam_policy.s3-packer.arn}"
}
