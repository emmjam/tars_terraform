resource "aws_sqs_queue" "printgovnotify" {
  name       = "${local.csi}-Queue-PrintGovNotify.fifo"
  fifo_queue = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/Queue-PrintGovNotify"
    },
  )
}

resource "aws_ssm_parameter" "sqs_printgovnotify" {
  name        = "/${var.environment}/tars/all/Queue-PrintGovNotify"
  description = "Queue name for letters to Gov Notify."
  type        = "SecureString"
  value       = aws_sqs_queue.printgovnotify.name

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/sqs_printgovnotify"
    },
  )
}