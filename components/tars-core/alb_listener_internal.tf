#Internal ALB only serves IRDT for Apache routing
resource "aws_alb_listener" "tars-internal-80" {
  load_balancer_arn = aws_alb.tars-internal.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.irdt-frontend-7443.arn
  }
}

