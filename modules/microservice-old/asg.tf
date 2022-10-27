resource "aws_autoscaling_group" "main" {
  name_prefix = format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    var.name,
  )

  launch_template {
    id      = aws_launch_template.main.id
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

  /*# add default tags loop here
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
  */

  tag {
    key                 = "Name"
    value               = format(
                            "%s-%s-%s/%s",
                            var.project,
                            var.environment,
                            var.component,
                            var.name,
                          )
    propagate_at_launch = true
  }

  tag {
    key                 = "Nodetype"
    value               = var.name
    propagate_at_launch = true
  }

  tag {
    key                 = "Component"
    value               = var.component
    propagate_at_launch = true
  }

  tag {
    key                 = "Module"
    value               = var.module
    propagate_at_launch = true
  }


  provisioner "local-exec" {
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.main.name} --desired-capacity ${var.asg_size_desired_on_create} --region ${data.aws_region.current.name}"
  }

  lifecycle {
    ignore_changes = [
      target_group_arns
    ]
  }
}

