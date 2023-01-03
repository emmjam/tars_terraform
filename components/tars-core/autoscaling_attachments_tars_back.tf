resource "aws_autoscaling_attachment" "tars-backend-8080" {
  autoscaling_group_name = module.tars_back.autoscaling_group_name
  lb_target_group_arn   = aws_alb_target_group.tars-backend-8080.arn
}

resource "aws_autoscaling_attachment" "tars-backend-api-8080" {
  autoscaling_group_name = module.tars_back.autoscaling_group_name
  lb_target_group_arn   = aws_alb_target_group.tars-backend-api-8080.arn
}

resource "aws_autoscaling_attachment" "tars-backend-payments-8080" {
  autoscaling_group_name = module.tars_back.autoscaling_group_name
  lb_target_group_arn   = aws_alb_target_group.tars-backend-payments-8080.arn
}

