resource "aws_autoscaling_schedule" "fyndi-f_down" {
  count                  = var.aws_autoscaling_enabled
  scheduled_action_name  = "${local.csi}/fyndi-f-down"
  min_size               = var.fyndi-f_asg_min_size
  max_size               = var.fyndi-f_asg_max_size
  desired_capacity       = var.fyndi-f_scaledown_desired
  recurrence             = var.fyndi-f_scaledown_recurrence
  autoscaling_group_name = module.fyndi-f.autoscaling_group_id
}

resource "aws_autoscaling_schedule" "fyndi-f_up" {
  count                  = var.aws_autoscaling_enabled
  scheduled_action_name  = "${local.csi}/fyndi-f-up"
  min_size               = var.fyndi-f_asg_min_size
  max_size               = var.fyndi-f_asg_max_size
  desired_capacity       = var.fyndi-f_scaleup_desired
  recurrence             = var.fyndi-f_scaleup_recurrence
  autoscaling_group_name = module.fyndi-f.autoscaling_group_id
}

