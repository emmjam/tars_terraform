data "template_file" "task" {
  template = file(
    "${path.module}/templates/task.json.tmpl",
  )


  vars = {
    region        = var.region
    image         = var.image
    log_group     = aws_cloudwatch_log_group.main.name
    stream_prefix = "${local.csi}-ecs"
    name          = "${var.name}"
    response_domain = "mock-epdq-${var.environment}-public.dvsa.tars.dev-dvsacloud.uk"
  }
}
