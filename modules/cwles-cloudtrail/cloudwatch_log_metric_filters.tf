resource "aws_cloudwatch_log_metric_filter" "cloudtrail" {
  count = length(var.custom_metrics)

  name = format(
    "%s/%s",
    aws_cloudwatch_log_group.cloudtrail.name,
    var.custom_metrics[count.index]["name"],
  )

  log_group_name = aws_cloudwatch_log_group.cloudtrail.name

  pattern = var.custom_metrics[count.index]["filter"]

  metric_transformation {
    namespace = format(
      "%s-%s-%s-%s",
      var.project,
      var.environment,
      var.component,
      var.module,
    )

    name          = var.custom_metrics[count.index]["name"]
    value         = "1"
    default_value = "0"
  }
}

