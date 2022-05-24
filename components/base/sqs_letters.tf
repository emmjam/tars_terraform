resource "aws_sqs_queue" "printgovnotify" {
  name = "${local.csi}-Queue-PrintGovNotify.fifo"

  receive_wait_time_seconds         = 10
  fifo_queue                        = true
  content_based_deduplication       = true
  kms_master_key_id                 = aws_kms_alias.print_key_alias.id
  kms_data_key_reuse_period_seconds = 3600

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/Queue-PrintGovNotify"
    },
  )

  depends_on = [
    aws_kms_alias.print_key_alias
  ]
}

resource "aws_kms_key" "print_key" {
  policy = data.aws_iam_policy_document.kms_root_managed.json
}

resource "aws_kms_alias" "print_key_alias" {
  name          = "alias/${local.csi}-sqs_print_key"
  target_key_id = aws_kms_key.print_key.id
}

resource "aws_ssm_parameter" "sqs_printgovnotify" {
  name        = "/${var.environment}/tars/all/Queue-PrintGovNotify"
  description = "Queue name for letters to Gov Notify."
  type        = "String"
  value       = aws_sqs_queue.printgovnotify.name

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/sqs_printgovnotify"
    },
  )
}