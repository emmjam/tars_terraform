data "template_file" "cw_event_pattern_failed_lifecycle_actions" {
  template = file(
    "${path.module}/templates/cw_event_pattern_failed_lifecycle_actions.json.tmpl",
  )

  vars = {
    ASG_NAME = aws_autoscaling_group.main.name
  }
}

