resource "aws_alb_listener" "private_http" {
  load_balancer_arn = aws_alb.private.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.private_default.arn
  }
}

