resource "aws_autoscaling_schedule" "sftpplus_svr_down" {
  count                  = var.aws_autoscaling_enabled
  scheduled_action_name  = "${local.csi}/sftpplus-svr-down"
  min_size               = var.sftpplus-svr_asg_min_size
  max_size               = var.sftpplus-svr_asg_max_size
  desired_capacity       = var.sftpplus-svr_scaledown_desired
  recurrence             = var.sftpplus-svr_scaledown_recurrence
  autoscaling_group_name = module.sftpplus_svr.autoscaling_group_id
}

resource "aws_autoscaling_schedule" "sftpplus_svr_up" {
  count                  = var.aws_autoscaling_enabled
  scheduled_action_name  = "${local.csi}/sftpplus-svr-up"
  min_size               = var.sftpplus-svr_asg_min_size
  max_size               = var.sftpplus-svr_asg_max_size
  desired_capacity       = var.sftpplus-svr_scaleup_desired
  recurrence             = var.sftpplus-svr_scaleup_recurrence
  autoscaling_group_name = module.sftpplus_svr.autoscaling_group_id
}

