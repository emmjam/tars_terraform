# AGS for TARS Mock server
resource "aws_autoscaling_group" "tars-mock" {
  name     = format("%s/%s", local.csi, "mock")
  max_size = var.wildfly-mock_asg_max_size
  min_size = var.wildfly-mock_asg_min_size
  #launch_configuration = aws_launch_configuration.tars-mock.id

  launch_template {
    id      = aws_launch_template.tars-mock.id
    version = "$Latest"
  }

  termination_policies = var.asg_termination_policies

  vpc_zone_identifier = data.terraform_remote_state.base.outputs.subnets_tars_backend

  target_group_arns = [
    aws_alb_target_group.tars-mock-8080.arn,
    aws_alb_target_group.tars-mock-8443.arn,
    aws_lb_target_group.mock-nlb.arn,
    aws_lb_target_group.mock-nlb-d90.arn,
  ]

  enabled_metrics = var.asg_enabled_metrics

  dynamic "tag" {
    for_each = local.asg_default_tags
    content {
      key   = tag.key
      value = tag.value

      propagate_at_launch = true
    }
  }


  # Spin up mock servers to the max defined
  # Spin up mock servers to the max defined
  provisioner "local-exec" {
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.tars-mock.name} --desired-capacity ${var.wildfly-mock_asg_max_size} --region ${var.aws_region}"
  }

  lifecycle {
    ignore_changes = [

    ]
  }
}

