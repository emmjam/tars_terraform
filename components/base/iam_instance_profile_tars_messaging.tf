# Create the tars core server instance profile
resource "aws_iam_instance_profile" "tars-messaging" {
  name = "${local.csi}-messaging"
  role = "${aws_iam_role.tars-messaging.name}"
}

resource "aws_iam_role" "tars-messaging" {
  name               = "${local.csi}-messaging"
  description        = "Allows EC2 instances to call AWS services on your behalf."
  assume_role_policy = "${data.aws_iam_policy_document.ec2_assumerole.json}"
}

resource "aws_iam_role_policy_attachment" "messaging" {
  role       = "${aws_iam_role.tars-messaging.name}"
  policy_arn = "${aws_iam_policy.messagingnode.arn}"
}

# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "messaging_hieradata" {
  role       = "${aws_iam_role.tars-messaging.name}"
  policy_arn = "${data.terraform_remote_state.acc.hieradata_kms_key_user_policy_arn}"
}
