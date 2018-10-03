# AGS for TARS Mock server
resource "aws_autoscaling_group" "tars-mock" {
  name_prefix = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    "wf-mock"
  )}"

  launch_configuration = "${aws_launch_configuration.tars-mock.id}"
  max_size             = "${var.wildfly-mock_asg_max_size}"
  min_size             = "${var.wildfly-mock_asg_min_size}"
  termination_policies = ["${var.asg_termination_policies}"]
  vpc_zone_identifier  = ["${data.terraform_remote_state.base.subnets_tars_backend}"]
  target_group_arns    = [
    "${aws_alb_target_group.tars-mock-8080.arn}",
    "${aws_alb_target_group.tars-mock-8443.arn}",
    "${aws_lb_target_group.mock-nlb.arn}",
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
            "wf-mock"
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

  # Spin up mock servers to the max defined
  provisioner "local-exec" {
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.tars-mock.name} --desired-capacity ${var.wildfly-mock_asg_max_size} --region ${var.aws_region}"
  }
}
