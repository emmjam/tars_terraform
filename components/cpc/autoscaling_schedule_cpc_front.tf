resource "aws_autoscaling_schedule" "cpc_front_down" {
  count                  = var.aws_autoscaling_enabled
  scheduled_action_name  = "${local.csi}/cpc-front-down"
  min_size               = var.cpc-front_asg_min_size
  max_size               = var.cpc-front_asg_max_size
  desired_capacity       = var.cpc-front_scaledown_desired
  recurrence             = var.cpc-front_scaledown_recurrence
  autoscaling_group_name = module.cpc-front.autoscaling_group_id
}

resource "aws_autoscaling_schedule" "tars_front_up" {
  count                  = var.aws_autoscaling_enabled
  scheduled_action_name  = "${local.csi}/cpc-front-up"
  min_size               = var.cpc-front_asg_min_size
  max_size               = var.cpc-front_asg_max_size
  desired_capacity       = var.cpc-front_scaleup_desired
  recurrence             = var.cpc-front_scaleup_recurrence
  autoscaling_group_name = module.cpc-front.autoscaling_group_id
}

