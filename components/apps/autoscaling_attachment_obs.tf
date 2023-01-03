resource "aws_autoscaling_attachment" "private-obs2-8080" {
  autoscaling_group_name = module.obs.autoscaling_group_name
  lb_target_group_arn   = data.terraform_remote_state.tars-core.outputs.alb-tg-obs2-8080
}
