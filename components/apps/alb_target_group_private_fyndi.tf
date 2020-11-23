resource "aws_alb_target_group" "private-fyndi-b-8080" {
  name     = "${local.csi}-fyndi-b-8080"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/DSAFindNearestService/services/findNearest.wsdl"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}

