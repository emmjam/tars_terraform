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

  dynamic "tag" {
    for_each = local.asg_default_tags
    content {
      key   = tag.key
      value = tag.value

      propagate_at_launch = true
    }
  }

  provisioner "local-exec" {
    command = "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${aws_autoscaling_group.main.name} --desired-capacity ${var.asg_size_desired_on_create} --region ${var.region}"
  }

  lifecycle {
    ignore_changes = [
      target_group_arns
    ]
  }
}

