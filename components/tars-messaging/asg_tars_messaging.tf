# ASG for tars messaging server
resource "aws_autoscaling_group" "tars-messaging" {
  name_prefix = "${local.csi}-wf-messaging-"
  max_size    = var.wildfly-messaging_asg_max_size
  min_size    = var.wildfly-messaging_asg_min_size
  #launch_configuration = aws_launch_configuration.tars-messaging.id

  launch_template {
    id = aws_launch_template.tars-messaging.id
    #version = "$Latest"
    version = aws_launch_template.tars-messaging.latest_version
  }

  termination_policies = var.asg_termination_policies

  vpc_zone_identifier = data.terraform_remote_state.base.outputs.subnets_tars_messaging

  target_group_arns = [
    aws_alb_target_group.tars-messaging-8080.arn,
    aws_alb_target_group.tars-messaging-80.arn,
  ]

  enabled_metrics = var.asg_enabled_metrics

  # add default tags loop here
  tag {
    key                 = var.asg_default_tags[0].key
    value               = var.asg_default_tags[0].value
    propagate_at_launch = var.asg_default_tags[0].propagate_at_launch
  }

  tag {
    key                 = var.asg_default_tags[1].key
    value               = var.asg_default_tags[1].value
    propagate_at_launch = var.asg_default_tags[1].propagate_at_launch
  }

  tag {
    key                 = var.asg_default_tags[2].key
    value               = var.asg_default_tags[2].value
    propagate_at_launch = var.asg_default_tags[2].propagate_at_launch
  }
  # end of loop

  tag {
    key                 = "Name"
    value               = "${local.csi}/wf-messaging"
    propagate_at_launch = true
  }

  tag {
    key                 = "Nodetype"
    value               = "wildfly"
    propagate_at_launch = true
  }

  tag {
    key                 = "Component"
    value               = var.component
    propagate_at_launch = true
  }

  # Spin up max desired messaging servers
  # Spin up max desired messaging servers
  provisioner "local-exec" {
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.tars-messaging.name} --desired-capacity ${var.wildfly-messaging_scaleup_desired} --region ${var.aws_region}"
  }

  lifecycle {
    ignore_changes = [
      target_group_arns
    ]
  }
}

