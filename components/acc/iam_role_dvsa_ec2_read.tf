resource "aws_iam_role" "DVSA-EC2-Read-Role" {
  name = "EC2-Read"
  description = "Role used by the DVSA infrastructure team to carry out inventory tasks, centrally, on the AWS estate. For more information contact InfrastructureServicesAWS@dvsa.gov.uk."
  assume_role_policy = "${data.aws_iam_policy_document.DVSA-EC2-Read-Role.json}"
}

data "aws_iam_policy" "AmazonEC2ReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "EC2-Read-role-policy-attach" {
  role = "${aws_iam_role.DVSA-EC2-Read-Role.name}"
  policy_arn = "${data.aws_iam_policy.AmazonEC2ReadOnlyAccess.arn}"
}
