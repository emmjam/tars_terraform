resource "aws_autoscaling_attachment" "cpc-back-8080" {
  autoscaling_group_name = module.cpc-back.autoscaling_group_name
  lb_target_group_arn   = aws_alb_target_group.cpc-back-8080.id
}

