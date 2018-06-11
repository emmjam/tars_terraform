resource "aws_iam_role" "DVSA-EC2-Read-Role" {
  name = "EC2-Read"
  description = "Role used by the DVSA infrastructure team to carry out inventory tasks, centrally, on the AWS estate. For more information contact InfrastructureServicesAWS@dvsa.gov.uk."
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
          "Action": [
            "sts:AssumeRole"
          ],
          "Effect": "Allow",
          "Principal": {
            "AWS": "arn:aws:iam::233824316563:user/CLI-ReadOnly01"
          },
          "Condition": {}
        }
      ]
  }
  EOF
}

data "aws_iam_policy" "AmazonEC2ReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "EC2-Read-role-policy-attach" {
  role = "${aws_iam_role.DVSA-EC2-Read-Role.name}"
  policy_arn = "${data.aws_iam_policy.AmazonEC2ReadOnlyAccess.arn}"
}
