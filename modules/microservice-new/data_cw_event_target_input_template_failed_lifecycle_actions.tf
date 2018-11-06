data "template_file" "cw_event_target_input_template_failed_lifecycle_actions" {
  template = "${file("${path.module}/templates/cw_event_target_input_template_failed_lifecycle_actions.json.tmpl")}"
}
