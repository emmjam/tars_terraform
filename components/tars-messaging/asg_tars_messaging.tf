# ASG for tars messaging server
resource "aws_autoscaling_group" "tars-messaging" {
  name_prefix          = "${local.csi}-wf-messaging-"
  max_size             = var.wildfly-messaging_asg_max_size
  min_size             = var.wildfly-messaging_asg_min_size
  launch_configuration = aws_launch_configuration.tars-messaging.id

  #launch_template {
  # id = aws_launch_template.tars-messaging.id
  #version = "$Latest"
  #}

  termination_policies = var.asg_termination_policies

  vpc_zone_identifier = data.terraform_remote_state.base.outputs.subnets_tars_messaging

  target_group_arns = [
    aws_alb_target_group.tars-messaging-8080.arn,
    aws_alb_target_group.tars-messaging-80.arn,
  ]

  enabled_metrics = var.asg_enabled_metrics

  tags = concat(
    var.asg_default_tags,
    [
      {
        "key"                 = "Name"
        "value"               = "${local.csi}/wf-messaging"
        "propagate_at_launch" = "true"
      },
      {
        "key"                 = "Nodetype"
        "value"               = "wildfly"
        "propagate_at_launch" = "true"
      },
      {
        "key"                 = "Component"
        "value"               = var.component
        "propagate_at_launch" = "true"
      },
    ],
  )

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

