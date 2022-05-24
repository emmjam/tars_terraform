resource "aws_iam_role" "fargate" {
  name = "${local.csi}-fargate"

  assume_role_policy = data.aws_iam_policy_document.ecs-tasks_assume_role.json

  tags = merge(
    local.default_tags,
    {
      "Name"      = "${local.csi}-fargate"
      "Component" = var.component
    },
  )
}

