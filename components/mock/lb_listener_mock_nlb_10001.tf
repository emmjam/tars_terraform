resource "aws_lb_listener" "mock-10001" {
  load_balancer_arn = aws_lb.mock-nlb.arn
  port              = "10001"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mock-nlb-d90.arn
  }
}
