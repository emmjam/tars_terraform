resource "aws_ecs_task_definition" "gov_gateway" {
  family                = "${local.csi}-ecs-gov-gateway"
  container_definitions = data.template_file.gov_gateway_task.rendered

  requires_compatibilities = list("FARGATE")

  cpu    = "512"
  memory = "1024"

  network_mode = "awsvpc"

  task_role_arn = aws_iam_role.main.arn

  execution_role_arn = aws_iam_role.fargate.arn

  tags = merge(
    local.default_tags,
    {
      "Name"      = "${local.csi}-task-gov-gateway"
      "Component" = var.component
    },
  ) 
}
