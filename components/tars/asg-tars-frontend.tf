resource "aws_autoscaling_group" "tars-frontend" {
  name_prefix = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    "wf-front"
  )}"

  launch_configuration = "${aws_launch_configuration.tars-frontend.id}"
  max_size             = "${lookup(var.wildfly-front,"asg_max_size")}"
  min_size             = "${lookup(var.wildfly-front,"asg_min_size")}"
  termination_policies = ["${var.asg_termination_policies}"]
  vpc_zone_identifier  = ["${data.terraform_remote_state.base.subnets_tars_backend}"]
  target_group_arns    = [
    "${aws_alb_target_group.tars-frontend-8443.arn}",
    "${aws_alb_target_group.tars-frontend-9990.arn}",
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
            "wf-front"
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

  provisioner "local-exec" {
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.tars-frontend.name} --desired-capacity ${lookup(var.wildfly-front,"asg_max_size")} --region ${var.aws_region}"
  }
}