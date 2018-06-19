# Create the tars core server instance profile
resource "aws_iam_instance_profile" "tars-core" {
  name = "${format(
     "%s-%s-%s-%s",
     var.project,
     var.environment,
     var.component,
     "core"
   )}"

  role = "${aws_iam_role.tars-core.name}"
}

resource "aws_iam_role" "tars-core" {
  name = "${format(
     "%s-%s-%s-%s",
     var.project,
     var.environment,
     var.component,
     "core"
   )}"

  description        = "Allows EC2 instances to call AWS services on your behalf."
  assume_role_policy = "${data.aws_iam_policy_document.ec2_assumerole.json}"
}

# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "hieradata" {
  role       = "${aws_iam_role.tars-core.name}"
  policy_arn = "${data.terraform_remote_state.acc.hieradata_kms_key_user_policy_arn}"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_tars_core" {
    role       = "${aws_iam_role.tars-core.name}"
    policy_arn = "${aws_iam_policy.cloudwatch.arn}"
}

