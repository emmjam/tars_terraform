resource "aws_iam_policy" "ecs" {
  name   = "${local.csi}-ecs"
  path   = "/"
  policy = data.aws_iam_policy_document.ecs.json
}

resource "aws_iam_role_policy_attachment" "fargate" {
  role       = aws_iam_role.fargate.name
  policy_arn = aws_iam_policy.ecs.arn
}

