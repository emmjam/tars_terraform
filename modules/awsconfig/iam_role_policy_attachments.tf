# The AWS-Managed Service Role Policy for AWS Config
resource "aws_iam_role_policy_attachment" "awsconfig" {
  role       = "${aws_iam_role.main.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

# The role policy created by this module to permit
# AWS Config to write output to the bucket created by this module
resource "aws_iam_role_policy_attachment" "bucketaccess" {
  role       = "${aws_iam_role.main.name}"
  policy_arn = "${aws_iam_policy.bucketaccess.arn}"
}
