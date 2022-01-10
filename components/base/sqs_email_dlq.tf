resource "aws_sqs_queue" "govnotify_dlq" {
  name = "${local.csi}-govnotify-dlq.fifo"

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/govnotify-dlq"
    },
  )
}
