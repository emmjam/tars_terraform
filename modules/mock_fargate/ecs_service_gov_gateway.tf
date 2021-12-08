resource "aws_ecs_service" "gov_gateway" {
  name            = "mock-gov-gateway"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.gov_gateway.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = concat(tolist([aws_security_group.gov_gateway.id]), var.additional_sg_ids)
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.mock_gov_gateway_9090_private.arn
    container_name   = local.gov_gateway_name
    container_port   = 9090
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.mock_gov_gateway_9090_public.arn
    container_name   = local.gov_gateway_name
    container_port   = 9090
  }

  tags = var.default_tags
}
