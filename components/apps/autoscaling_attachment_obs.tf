resource "aws_autoscaling_attachment" "obs-8080" {
  autoscaling_group_name = module.obs.autoscaling_group_name
  alb_target_group_arn   = aws_alb_target_group.obs-8080.id
}

