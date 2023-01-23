# Empirical evidence suggests that this will still apply to first-run instances
# even though we set desired_on_create in the local-exec for the ASG, which you might
# expect to cause the creation of instances before this hook exists and is attached.
# Keep an eye on it, but Dawid says it worked fine for him.
resource "aws_autoscaling_lifecycle_hook" "mock-launching" {

  name = format("%s/%s", local.csi, "mock")

  autoscaling_group_name = aws_autoscaling_group.tars-mock.name
  default_result         = "ABANDON"
  heartbeat_timeout      = 500
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_LAUNCHING"
}

