# ASG for the cpc batch server
resource "aws_autoscaling_group" "cpc-batch" {
  name_prefix = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    "cpc-batch"
  )}"

  launch_configuration = "${aws_launch_configuration.cpc-batch.id}"
  max_size             = "${var.cpc-batch_asg_max_size}"
  min_size             = "${var.cpc-batch_asg_min_size}"
  termination_policies = ["${var.asg_termination_policies}"]
  vpc_zone_identifier  = ["${data.terraform_remote_state.cpc.subnet_cidrs_cpc_backend}"]
  enabled_metrics      = ["${var.asg_enabled_metrics}"]

  tags = [
    "${concat(
      var.asg_default_tags,
      list(
        map(
          "key", "Name",
          "value", format(
            "%s-%s-%s/%s",
            var.project,
            var.environment,
            var.component,
            "cpc-batch"
          ),
          "propagate_at_launch", "true"
        ),
        map(
          "key", "Nodetype",
          "value", "cpc-batch",
          "propagate_at_launch", "true"
        ),
        map(
          "key", "Component",
          "value", var.component,
          "propagate_at_launch", "true"
        )
      )
    )}",
  ]

  # Spin up the max specified in the config
  provisioner "local-exec" {
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.cpc-batch.name} --desired-capacity ${var.cpc-batch_asg_max_size} --region ${var.aws_region}"
  }
}
