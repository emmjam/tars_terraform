resource "aws_autoscaling_schedule" "jenkinsnode_down" {
  scheduled_action_name  = "${local.csi}/jenkinsnode-down"
  min_size               = var.jenkinsctrl_asg_min_size
  max_size               = var.jenkinsctrl_asg_max_size
  desired_capacity       = var.jenkinsctrl_scaledown_desired
  recurrence             = var.jenkinsctrl_scaledown_recurrence
  autoscaling_group_name = module.jenkinsnode.autoscaling_group_id
}

resource "aws_autoscaling_schedule" "jenkinsnode_up" {
  scheduled_action_name  = "${local.csi}/jenkinsnode-up"
  min_size               = var.jenkinsctrl_asg_min_size
  max_size               = var.jenkinsctrl_asg_max_size
  desired_capacity       = var.jenkinsctrl_scaleup_desired
  recurrence             = var.jenkinsctrl_scaleup_recurrence
  autoscaling_group_name = module.jenkinsnode.autoscaling_group_id
}

