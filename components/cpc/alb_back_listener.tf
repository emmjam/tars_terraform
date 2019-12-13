# ALB Listener for port 8080
resource "aws_alb_listener" "cpc-back-8080" {
  load_balancer_arn = aws_alb.cpc-back.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cpc-back-8080.arn
  }
}

