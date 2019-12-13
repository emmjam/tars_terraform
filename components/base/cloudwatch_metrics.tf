resource "aws_cloudwatch_log_metric_filter" "elisemonitor" {
  count          = contains(var.metric_env, var.environment) ? 1 : 0
  name           = "EliseConnectionError"
  pattern        = "ELISE_CONNECTION_TIMEOUT"
  log_group_name = var.elise_log_group_name

  metric_transformation {
    name          = "EliseConnectionError"
    namespace     = "Elise"
    value         = "1"
    default_value = "0"
  }
}

resource "aws_cloudwatch_log_metric_filter" "elisemonitor2" {
  count          = contains(var.metric_env, var.environment) ? 1 : 0
  name           = "EliseConnectionSuccess"
  pattern        = "SUCCESS"
  log_group_name = var.elise_log_group_name

  metric_transformation {
    name          = "EliseConnectionSuccess"
    namespace     = "Elise"
    value         = "1"
    default_value = "0"
  }
}

