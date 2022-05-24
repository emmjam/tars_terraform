resource "aws_autoscaling_attachment" "apache-ibs-80" {
  count                  = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  autoscaling_group_name = data.terraform_remote_state.tars-core.outputs.tars-apache-autoscaling-group-name
  alb_target_group_arn   = aws_alb_target_group.ibs-80[0].arn
}

