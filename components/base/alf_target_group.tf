resource "aws_lb_target_group" "target_group" {
  name        = "target-group"
  port        = 443
  protocol    = "HTTPS"
  vpc_id      = aws_vpc.vpc.id

  health_check {
    protocol = "HTTPS"
    port     = "443"
    path     = "/healthcheck"
  }

  tags = {
    Environment = "nonprod"
  }
}


