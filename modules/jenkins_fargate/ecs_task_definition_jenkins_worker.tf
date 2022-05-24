resource "aws_ecs_task_definition" "jenkins_worker" {
  family = "${local.csi}-jenkins_worker"
  container_definitions = templatefile("${path.module}/templates/jenkins_worker_task.json.tmpl",
    {
      region             = var.region
      java_options       = var.jenkins_java_options
      image              = var.jenkins_worker_image
      log_group          = aws_cloudwatch_log_group.main.name
      stream_prefix      = "${var.project}-jenkins_worker"
      name               = "jenkins_worker"
      memory_reservation = "2048"
  })

  requires_compatibilities = tolist(["FARGATE"])

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