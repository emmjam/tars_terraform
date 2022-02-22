resource "aws_alb_target_group" "tarspub443" {
  name     = "${local.csi}-tarspub443"
  port     = "443"
  protocol = "HTTPS"
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

