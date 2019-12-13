resource "aws_alb_target_group" "nexus_private" {
  name     = "nexus-private"
  port     = "8081"
  protocol = "HTTP"
  vpc_id   = aws_vpc.mgmt.id

  health_check {
    path                = "/"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}

