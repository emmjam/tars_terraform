resource "aws_autoscaling_attachment" "xenco" {
  autoscaling_group_name = module.xenco.autoscaling_group_name
  alb_target_group_arn   = aws_lb_target_group.xenco.id
}

