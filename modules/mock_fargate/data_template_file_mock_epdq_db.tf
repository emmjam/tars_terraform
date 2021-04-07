data "template_file" "epdq_db_task" {
  template = file(
    "${path.module}/templates/epdq_db_task.json.tmpl",
  )

  vars = {
    region             = var.region
    epdq_db_image      = var.epdq_db_image
    epdq_log_group     = aws_cloudwatch_log_group.epdq.name
    epdq_stream_prefix = "${local.csi}-ecs-epdq"
    epdq_name          = local.epdq_name
  }
}
