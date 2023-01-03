resource "aws_autoscaling_attachment" "cpc-front-dvsa-8443" {
  autoscaling_group_name = module.cpc-front.autoscaling_group_name
  lb_target_group_arn   = aws_alb_target_group.cpc-front-dvsa-8443.id
}

resource "aws_autoscaling_attachment" "cpc-front-dvsa-internet-8443" {
  autoscaling_group_name = module.cpc-front.autoscaling_group_name
  lb_target_group_arn   = aws_alb_target_group.cpc-front-dvsa-internet-8443.id
}

resource "aws_autoscaling_attachment" "cpc-front-dva-7443" {
  autoscaling_group_name = module.cpc-front.autoscaling_group_name
  lb_target_group_arn   = aws_alb_target_group.cpc-front-dva-7443.id
}

resource "aws_autoscaling_attachment" "cpc-front-internal2-9443" {
  autoscaling_group_name = module.cpc-front.autoscaling_group_name
  lb_target_group_arn   = data.terraform_remote_state.tars-core.outputs.alb-tg-cpc2-9443
}