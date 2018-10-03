# ASG for the tars core frontend server
resource "aws_autoscaling_group" "tars-frontend" {
  name_prefix = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    "tars-front"
  )}"

  launch_configuration = "${aws_launch_configuration.tars-frontend.id}"
  max_size             = "${var.wildfly-front_asg_max_size}"
  min_size             = "${var.wildfly-front_asg_min_size}"
  termination_policies = ["${var.asg_termination_policies}"]
  vpc_zone_identifier  = ["${data.terraform_remote_state.base.subnets_tars_web}"]
  target_group_arns    = [
    "${aws_alb_target_group.tars-frontend-8443.arn}",
    "${aws_alb_target_group.irdt-frontend-7443.arn}",
    "${aws_alb_target_group.tars-frontend-private-8443.arn}",
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
            "tars-front"
          ),
          "propagate_at_launch", "true"
        ),
        map(
          "key", "Nodetype",
          "value", "tars-front",
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
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.tars-frontend.name} --desired-capacity ${var.wildfly-front_asg_max_size} --region ${var.aws_region}"
  }
}
