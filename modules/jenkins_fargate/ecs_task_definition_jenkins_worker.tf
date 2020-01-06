resource "aws_ecs_task_definition" "jenkins_worker" {
  family                = "${local.csi}-jenkins_worker"
  container_definitions = data.template_file.jenkins_worker_task.rendered

  requires_compatibilities = list("FARGATE")

  cpu    = "1024"
  memory = "2048"

  network_mode = "awsvpc"

  task_role_arn = aws_iam_role.jenkins_worker.arn

  execution_role_arn = aws_iam_role.fargate.arn

  tags = merge(
    local.default_tags,
    {
      "Name"      = "${local.csi}-jenkins_worker"
      "Component" = var.component
    },
  ) 
}