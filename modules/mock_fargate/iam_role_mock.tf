resource "aws_iam_role" "main" {
  name = "${local.csi}-role"

  assume_role_policy = data.aws_iam_policy_document.ecs-tasks_assume_role.json
}

