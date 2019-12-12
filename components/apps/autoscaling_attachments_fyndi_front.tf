resource "aws_autoscaling_attachment" "fyndi-f-8080" {
  autoscaling_group_name = module.fyndi-f.autoscaling_group_name
  alb_target_group_arn   = aws_alb_target_group.fyndi-f-8080.id
}

