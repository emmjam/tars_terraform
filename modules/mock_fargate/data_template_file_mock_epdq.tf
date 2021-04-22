data "template_file" "epdq_task" {
  template = file(
    "${path.module}/templates/epdq_task.json.tmpl",
  )

  vars = {
    region               = var.region
    epdq_image           = var.epdq_image
    epdq_db_image        = var.epdq_db_image
    epdq_log_group       = aws_cloudwatch_log_group.epdq.name
    epdq_stream_prefix   = "${local.csi}-ecs-epdq"
    epdq_name            = local.epdq_name
    epdq_response_domain = "https://mock-epdq-${var.environment}-public.dvsa.tars.dev-dvsacloud.uk"
    async_callback_url   = "http://tars-core-backend.${var.environment}.tars.dvsa.aws:8080/DSAPostPaymentConfirmationService/confirm"
  }
}
