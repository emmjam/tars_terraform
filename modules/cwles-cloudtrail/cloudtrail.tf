resource "aws_cloudtrail" "cloudtrail" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
  )

  s3_bucket_name                = module.standard_bucket.id
  s3_key_prefix                 = ""
  include_global_service_events = "true"
  is_multi_region_trail         = "true"
  enable_log_file_validation    = "true"
  enable_logging                = "true"
  cloud_watch_logs_group_arn    = "${aws_cloudwatch_log_group.cloudtrail.arn}:*"
  cloud_watch_logs_role_arn     = aws_iam_role.cloudtrail.arn
  sns_topic_name                = aws_sns_topic.cloudtrail.name

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        var.project,
        var.component,
        var.environment,
        "cwles",
      )
      "Module" = var.module
    },
  )

  depends_on = [
    aws_s3_bucket_policy.cloudtrail,
    aws_sns_topic_policy.cloudtrail,
  ]
}

