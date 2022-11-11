# Create ASG and add launch configration to it
resource "aws_autoscaling_group" "main" {
  name = format("%s/%s", local.csi, var.name)

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }

  #launch_configuration = aws_launch_configuration.main.id
  max_size                  = var.asg_size_max
  min_size                  = var.asg_size_min
  wait_for_capacity_timeout = 0

  termination_policies = var.asg_termination_policies

  vpc_zone_identifier = concat(module.subnets.subnet_ids, var.subnets_ids)

  load_balancers = compact(var.asg_load_balancers)

  enabled_metrics   = var.asg_enabled_metrics
  target_group_arns = compact(var.target_group_arns)

  # It is 100% acknowledged that this is a horrific awful and horrible
  # hack and indefensible duplication. I get it, I really do.
  # But until we have some kind of solution for this:
  # https://github.com/terraform-providers/terraform-provider-aws/issues/874
  # this is the only way I can think of to provide a single source of
  # interpolated tag insertion that works for AWS Autoscaling Groups.
  # Please don't hurt me.
  
  # removed due to provider update
  tags = concat(
    var.asg_default_tags,
    [
      {
        "key"                 = "Name"
        "value"               = format("%s/%s", local.csi, var.name)
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
  
  /*
  # default tags replacement
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
  


  tag {
    key                 = "Name"
    value               = format("%s/%s", local.csi, var.name)
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
  }*/

  provisioner "local-exec" {
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.main.name} --desired-capacity ${var.asg_size_desired_on_create} --region ${var.region}"
  }

  lifecycle {
    ignore_changes = [
      target_group_arns
    ]
  }
}

