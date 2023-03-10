# TARS Mock AB target group for port 8080
resource "aws_alb_target_group" "tars-mock-8080" {
  name     = "${local.csi}-8080"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}

