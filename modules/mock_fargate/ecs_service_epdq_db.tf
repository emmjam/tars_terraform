resource "aws_ecs_service" "epdq_db" {
  name            = "mock-epdq-db"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.epdq_db.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  service_registries {
    registry_arn = aws_service_discovery_service.epdq_db.arn
  }

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = concat(tolist([aws_security_group.epdq_db.id]), var.additional_sg_ids)
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.epdq-db.arn
    container_name   = "${local.epdq_name}-db"
    container_port   = 5432
  }

  tags = var.default_tags
}
