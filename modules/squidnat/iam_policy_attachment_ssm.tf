resource "aws_iam_role_policy_attachment" "cloudwatch_squidnat_0" {
  role       = module.microservice_squidnat_0.iam_role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_squidnat_1" {
  role       = module.microservice_squidnat_1.iam_role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "cloudwatch_squidnat_2" {
  role       = module.microservice_squidnat_2.iam_role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}