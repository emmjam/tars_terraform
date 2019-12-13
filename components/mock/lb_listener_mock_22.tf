resource "aws_lb_listener" "mock-22" {
  load_balancer_arn = aws_lb.mock-nlb.arn
  port              = "22"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mock-nlb.arn
  }
}

