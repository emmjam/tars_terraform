# TARS Mock ALB Listener for port 8080
resource "aws_alb_listener" "tars-mock-8080" {
  load_balancer_arn = aws_alb.tars-alb-mock-private.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tars-mock-8080.arn
  }
}

