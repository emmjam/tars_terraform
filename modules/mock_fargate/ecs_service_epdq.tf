resource "aws_ecs_service" "epdq" {
  name            = "mock-epdq"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.epdq.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = concat(list(aws_security_group.epdq.id), var.additional_sg_ids)
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.mock-epdq-8080-private.arn
    container_name   = local.epdq_name
    container_port   = 8080
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.mock-epdq-8080-public.arn
    container_name   = local.epdq_name
    container_port   = 8080
  }
}
