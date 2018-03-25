# AGS for TARS Batch server
resource "aws_autoscaling_group" "tars-batch" {
  name_prefix = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    "wf-batch"
  )}"

  launch_configuration = "${aws_launch_configuration.tars-batch.id}"
  max_size             = "${lookup(var.wildfly-batch,"asg_max_size")}"
  min_size             = "${lookup(var.wildfly-batch,"asg_min_size")}"
  termination_policies = ["${var.asg_termination_policies}"]
  vpc_zone_identifier  = ["${data.terraform_remote_state.base.subnets_tars_backend}"]
  target_group_arns    = [
    "${aws_alb_target_group.tars-batch-8080.arn}",
    ]
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
            "wf-batch"
          ),
          "propagate_at_launch", "true"
        ),
        map(
          "key", "Nodetype",
          "value", "wildfly",
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

  # Spin up batch servers to the max defined
  provisioner "local-exec" {
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.tars-batch.name} --desired-capacity ${lookup(var.wildfly-batch,"asg_max_size")} --region ${var.aws_region}"
  }
}