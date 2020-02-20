resource "aws_ecs_service" "main" {
  name            = var.name
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = concat(list(aws_security_group.mock.id), var.additional_sg_ids)
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.mock-epdq-8080.arn
    container_name   = var.name
    container_port   = 8080
  }

}