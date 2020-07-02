resource "aws_autoscaling_attachment" "apache-80" {
  autoscaling_group_name = module.apache.autoscaling_group_name
  alb_target_group_arn   = aws_alb_target_group.apache-80.arn
}

resource "aws_autoscaling_attachment" "apache-ibs-80" {
  count = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  autoscaling_group_name = module.apache.autoscaling_group_name
  alb_target_group_arn   = "${data.terraform_remote_state.apps.outputs.ibs-alb-target-group-ibs-apache}"
}

