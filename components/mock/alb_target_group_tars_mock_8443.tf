# TARS Mock AB target group for port 8443
resource "aws_alb_target_group" "tars-mock-8443" {
  name     = "${local.csi}-8443"
  port     = "8443"
  protocol = "HTTPS"
  vpc_id   = data.terraform_remote_state.base.outputs.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTPS"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}

