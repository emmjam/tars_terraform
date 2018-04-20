# The AWS Config Configuration Recorder
# Hard-coded to record all supported objects including global
# on purpose per the intended use for this module
resource "aws_config_configuration_recorder" "main" {
  name = "default"

/*
  # Ideally we would construct the name in the manner below, however
  # as we want to import GUI-created recorders which use the name "default"
  # and since you can only have one recorder per region, for which there are
  # distinct namespaces, using default here is acceptable
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module
  )}"
*/

  recording_group {
    all_supported                 = "true"
    include_global_resource_types = "true"
  }

  role_arn = "${aws_iam_role.main.arn}"
}
