resource "aws_cloudwatch_log_group" "epdq" {
  name              = "${local.csi}-epdq"
  retention_in_days = var.cwl_retention_in_days

  tags = merge(
    var.default_tags,
    {
      "Name"   = local.csi
      "Module" = var.module
    },
  )
}

