resource "aws_iam_group_policy_attachment" "qaengineer" {
  group      = aws_iam_group.qaengineer.name
  policy_arn = aws_iam_policy.assume_qaengineer_role.arn
}
