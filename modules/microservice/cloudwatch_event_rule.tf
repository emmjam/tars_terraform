# Event rule to monitor for failed ASG lifecycle actions
resource "aws_cloudwatch_event_rule" "failed_lifecycle_actions" {
  count = var.lifecycle_hook_launching_enabled

  name = format("%s-%s-%s", local.csi, var.name, "failed-lifecycle-actions")

  description = "Alert on failed autoscaling lifecycle actions"

  event_pattern = data.template_file.cw_event_pattern_failed_lifecycle_actions.rendered
}

