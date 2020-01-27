resource "aws_iam_role_policy_attachment" "builder" {
  policy_arn = aws_iam_policy.builder.arn

  role = module.builder.iam_role_name
}

resource "aws_iam_role_policy_attachment" "builder-yum" {
  policy_arn = aws_iam_policy.s3_yum_read_write.arn

  role = module.builder.iam_role_name
}


