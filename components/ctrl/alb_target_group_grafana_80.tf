resource "aws_alb_target_group" "grafana-80" {
  name     = "${local.csi}-grafana-80"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_vpc.ctrl.id

  health_check {
    path                = "/"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}

