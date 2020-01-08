resource "aws_iam_role" "jenkins_worker" {
  name = "${local.csi}-jenkins_worker"

  assume_role_policy = data.aws_iam_policy_document.ecs-tasks_assume_role.json
}

