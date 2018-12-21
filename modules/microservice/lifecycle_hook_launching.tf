# Empirical evidence suggests that this will still apply to first-run instances
# even though we set desired_on_create in the local-exec for the ASG, which you might
# expect to cause the creation of instances before this hook exists and is attached.
# Keep an eye on it, but Dawid says it worked fine for him.
resource "aws_autoscaling_lifecycle_hook" "launching" {
  count = "${var.lifecycle_hook_launching_enabled}"

  name = "${format(
    "%s/%s/%s",
    local.csi,
    var.name,
    "launching"
  )}"

  autoscaling_group_name  = "${aws_autoscaling_group.main.name}"
  default_result          = "${var.lifecycle_hook_launching_default_result}"
  heartbeat_timeout       = "${var.lifecycle_hook_launching_timeout}"
  lifecycle_transition    = "autoscaling:EC2_INSTANCE_LAUNCHING"
}
