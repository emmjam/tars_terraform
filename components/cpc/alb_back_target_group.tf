# TARS Batch AB target group for port 8080
resource "aws_alb_target_group" "cpc-back-8080" {
  name     = "${local.csi}-back-8080"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/healthcheckupservice/HealthCheckUpWebService/HealthCheckUpEndPoint?wsdl"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}

resource "aws_autoscaling_attachment" "cpc-back" {
  autoscaling_group_name = module.cpc-back.autoscaling_group_id
  alb_target_group_arn   = aws_alb_target_group.cpc-back-8080.arn
}

