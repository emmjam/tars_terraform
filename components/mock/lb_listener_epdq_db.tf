resource "aws_lb_listener" "epdq-db" {
  load_balancer_arn = aws_lb.mock-nlb.arn
  port              = "5432"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = module.mock_fargate.lb_target_group_epdq-db
  }
}