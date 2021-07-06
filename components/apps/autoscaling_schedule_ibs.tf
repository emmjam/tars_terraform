resource "aws_autoscaling_schedule" "ibs_down" {
  count                  = var.aws_autoscaling_enabled
  scheduled_action_name  = "${local.csi}/ibs-down"
  min_size               = var.ibs_asg_min_size
  max_size               = var.ibs_asg_max_size
  desired_capacity       = var.ibs_scaledown_desired
  recurrence             = var.ibs_scaledown_recurrence
  autoscaling_group_name = module.ibs.autoscaling_group_id
}

resource "aws_autoscaling_schedule" "ibs_up" {
  count                  = var.aws_autoscaling_enabled
  scheduled_action_name  = "${local.csi}/ibs-up"
  min_size               = var.ibs_asg_min_size
  max_size               = var.ibs_asg_max_size
  desired_capacity       = var.ibs_scaleup_desired
  recurrence             = var.ibs_scaleup_recurrence
  autoscaling_group_name = module.ibs.autoscaling_group_id
}

resource "aws_autoscaling_policy" "ibs" {
  count                  = var.aws_autoscaling_enabled
  name                   = "${local.csi}/ibs"
  autoscaling_group_name = module.ibs.autoscaling_group_id
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 60.0
  }
}
