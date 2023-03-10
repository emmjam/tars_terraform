resource "aws_autoscaling_group" "main" {
  name_prefix = format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    var.name,
  )

  launch_template {
    id = aws_launch_template.main.id
    version = "$Latest"
  }

  #launch_configuration = aws_launch_configuration.main.id
  max_size             = var.asg_size_max
  min_size             = var.asg_size_min
  termination_policies = var.asg_termination_policies
  vpc_zone_identifier  = module.subnets.subnet_ids
  load_balancers       = var.asg_load_balancers
  target_group_arns    = var.asg_target_group_arns
  enabled_metrics      = var.asg_enabled_metrics

  tags = concat(
    var.asg_default_tags,
    [
      {
        "key" = "Name"
        "value" = format(
          "%s-%s-%s/%s",
          var.project,
          var.environment,
          var.component,
          var.name,
        )
        "propagate_at_launch" = "true"
      },
      {
        "key"                 = "Nodetype"
        "value"               = var.name
        "propagate_at_launch" = "true"
      },
      {
        "key"                 = "Component"
        "value"               = var.component
        "propagate_at_launch" = "true"
      },
      {
        "key"                 = "Module"
        "value"               = var.module
        "propagate_at_launch" = "true"
      },
    ],
  )

  provisioner "local-exec" {
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.main.name} --desired-capacity ${var.asg_size_desired_on_create} --region ${data.aws_region.current.name}"
  }

  lifecycle {
    ignore_changes = [
      target_group_arns
    ]
  }
}

