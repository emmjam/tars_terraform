resource "aws_autoscaling_attachment" "private-obs-8080" {
  autoscaling_group_name = module.obs.autoscaling_group_name
  alb_target_group_arn   = aws_alb_target_group.private-obs-8080.id
}

resource "aws_autoscaling_attachment" "obs-public-8080" {
  autoscaling_group_name = module.obs.autoscaling_group_name
  alb_target_group_arn   = data.terraform_remote_state.tars-core.outputs.alb-tg-obs-8080
}
