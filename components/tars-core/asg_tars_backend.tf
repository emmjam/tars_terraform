# ASG for the tars core backend server
resource "aws_autoscaling_group" "tars-backend" {
  name_prefix          = "${local.csi}-tars-back-"
  launch_configuration = "${aws_launch_configuration.tars-backend.id}"
  max_size             = "${var.wildfly-back_asg_max_size}"
  min_size             = "${var.wildfly-back_asg_min_size}"

  termination_policies = [
    "${var.asg_termination_policies}",
  ]

  vpc_zone_identifier = [
    "${data.terraform_remote_state.base.subnets_tars_backend}",
  ]

  target_group_arns = [
    "${aws_alb_target_group.tars-backend-8080.arn}",
    # "${aws_alb_target_group.tars-backend-9990.arn}",
  ]

  enabled_metrics = [
    "${var.asg_enabled_metrics}",
  ]

  tags = [
    "${concat(
      var.asg_default_tags,
      list(
        map(
          "key", "Name",
          "value", "${local.csi}/tars-back",
          "propagate_at_launch", "true"
        ),
        map(
          "key", "Nodetype",
          "value", "tars-back",
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
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.tars-backend.name} --desired-capacity ${var.wildfly-back_asg_max_size} --region ${var.aws_region}"
  }
}
