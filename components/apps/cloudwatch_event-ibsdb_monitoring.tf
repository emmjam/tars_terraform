resource "aws_cloudwatch_event_rule" "ibsdb_monitoring" {
  name                = "${local.csi}-ibsdb-monitoring"
  description         = "IBSDB Monitoring trigger"
  is_enabled          = var.ibsdb_monitoring_enabled
  schedule_expression = "rate(1 minute)"

  tags = merge(
    local.default_tags,
    tomap({
      "Name" = "${local.csi}/ibsdb-monitoring",
    }),
  )
}

resource "aws_cloudwatch_event_target" "ibsdb_monitoring" {
  target_id = "${local.csi}-ibsdb-monitoring"
  rule      = aws_cloudwatch_event_rule.ibsdb_monitoring.name
  arn       = module.lambda_ibsdb_monitoring.arn
}
