resource "aws_alb_target_group" "private_default" {
  name     = "default-private"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_vpc.mgmt.id
}

