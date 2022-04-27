resource "aws_ecs_task_definition" "epdq" {
  family                = "${local.csi}-ecs-epdq"
  container_definitions = templatefile("${path.module}/templates/epdq_task.json.tmpl", 
      {
        region               = var.region
        epdq_image           = var.epdq_image
        epdq_db_image        = var.epdq_db_image
        epdq_log_group       = aws_cloudwatch_log_group.epdq.name
        epdq_stream_prefix   = "${local.csi}-ecs-epdq"
        epdq_name            = local.epdq_name
        epdq_response_domain = "https://mock-epdq-${var.environment}-public.dvsa.tars.dev-dvsacloud.uk"
        async_callback_url   = "http://tars-core-backend.${var.environment}.nonprod.tars.dev-dvsacloud.uk:8080/DSAPostPaymentConfirmationService/confirm"
      })

  requires_compatibilities = tolist(["FARGATE"])

  cpu    = "512"
  memory = "1024"

  network_mode = "awsvpc"

  task_role_arn = aws_iam_role.main.arn

  execution_role_arn = aws_iam_role.fargate.arn

  tags = merge(
    local.default_tags,
    {
      "Name"      = "${local.csi}-task-epdq"
      "Component" = var.component
    },
  )
}
