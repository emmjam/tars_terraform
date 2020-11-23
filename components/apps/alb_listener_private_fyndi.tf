resource "aws_alb_listener" "private-8080" {
  load_balancer_arn = aws_alb.private.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.private-fyndi-b-8080.arn
  }
}

