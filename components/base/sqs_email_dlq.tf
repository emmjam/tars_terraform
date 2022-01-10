resource "aws_sqs_queue" "govnotify_dlq" {
  name                       = "${local.csi}_govnotify_dlq.fifo"

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/govnotify_dlq"
    },
  )
}
