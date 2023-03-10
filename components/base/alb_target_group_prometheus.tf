resource "aws_alb_target_group" "prometheus-9090" {
  name     = "${local.csi}-prometheus-9090"
  port     = "9090"
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path                = "/graph"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}

