resource "aws_iam_role" "packer" {
  name               = "${local.csi}-packer"
  description        = "Allows EC2 instances to call AWS services on your behalf."
  assume_role_policy = data.aws_iam_policy_document.ec2_assumerole.json
}

