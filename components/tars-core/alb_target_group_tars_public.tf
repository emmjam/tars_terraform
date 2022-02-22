resource "aws_alb_target_group" "tarspub80" {
  name     = "${local.csi}-tarspub80"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/healthcheck.html"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}

