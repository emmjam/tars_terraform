resource "aws_autoscaling_attachment" "tars-batch-8080" {
  autoscaling_group_name = module.tars_batch.autoscaling_group_name
  alb_target_group_arn   = aws_alb_target_group.tars-batch-8080.arn
}

