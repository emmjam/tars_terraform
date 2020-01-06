data "aws_iam_policy" "jenkins_worker" {
  arn = var.worker_iam_policy_arn
}

resource "aws_iam_role_policy_attachment" "jenkins_worker" {
  role       = aws_iam_role.jenkins_worker.name
  policy_arn = data.aws_iam_policy.jenkins_worker.arn
}

