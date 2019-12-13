resource "aws_autoscaling_schedule" "tars_back_down" {
  count                  = var.aws_autoscaling_enabled
  scheduled_action_name  = "${local.csi}/jenkins-down"
  min_size               = var.wildfly-back_asg_min_size
  max_size               = var.wildfly-back_asg_max_size
  desired_capacity       = var.wildfly-back_scaledown_desired
  recurrence             = var.wildfly-back_scaledown_recurrence
  autoscaling_group_name = module.tars_back.autoscaling_group_id
}

resource "aws_autoscaling_schedule" "tars_back_up" {
  count                  = var.aws_autoscaling_enabled
  scheduled_action_name  = "${local.csi}/jenkins-up"
  min_size               = var.wildfly-back_asg_min_size
  max_size               = var.wildfly-back_asg_max_size
  desired_capacity       = var.wildfly-back_scaleup_desired
  recurrence             = var.wildfly-back_scaleup_recurrence
  autoscaling_group_name = module.tars_back.autoscaling_group_id
}

