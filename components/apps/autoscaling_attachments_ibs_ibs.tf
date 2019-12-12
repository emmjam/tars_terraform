resource "aws_autoscaling_attachment" "ibs-8080" {
  autoscaling_group_name = module.ibs.autoscaling_group_name
  alb_target_group_arn   = aws_alb_target_group.ibs-8080.id
}

