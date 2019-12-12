resource "aws_lb_listener" "xenco" {
  load_balancer_arn = aws_lb.xenco.arn
  port              = "16385"
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.xenco.arn
    type             = "forward"
  }
}

