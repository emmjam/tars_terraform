resource "aws_iam_role_policy_attachment" "nexus_describe_efs" {
  role       = "${module.microservice_nexus.iam_role_name}"
  policy_arn = "${aws_iam_policy.describe_efs.arn}"
}
