# Event rule to monitor for failed ASG lifecycle actions
resource "aws_cloudwatch_event_rule" "failed_lifecycle_actions" {
  count = var.lifecycle_hook_launching_enabled

  name = format("%s-%s-%s", local.csi, var.name, "failed-lifecycle-actions")

  description = "Alert on failed autoscaling lifecycle actions"

  event_pattern = templatefile(
    "${path.module}/templates/cw_event_pattern_failed_lifecycle_actions.json.tmpl",
    { ASG_NAME = aws_autoscaling_group.main.name }
  )
}

