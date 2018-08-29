resource "aws_iam_instance_profile" "prometheus" {
  name = "${format(
     "%s-%s-%s-%s",
     var.project,
     var.environment,
     var.component,
     "prometheus"
   )}"

  role = "${aws_iam_role.prometheus.name}"
}

resource "aws_iam_role" "prometheus" {
  name = "${format(
     "%s-%s-%s-%s",
     var.project,
     var.environment,
     var.component,
     "prometheus"
   )}"

  description        = "Allows EC2 instances to call AWS services on your behalf."
  assume_role_policy = "${data.aws_iam_policy_document.ec2_assumerole.json}"
}

# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "hieradata-prometheus" {
  role       = "${aws_iam_role.prometheus.name}"
  policy_arn = "${data.terraform_remote_state.acc.hieradata_kms_key_user_policy_arn}"
}

resource "aws_iam_role_policy_attachment" "prometheus" {
    role       = "${aws_iam_role.prometheus.name}"
    policy_arn = "${aws_iam_policy.prometheus.arn}"
}

