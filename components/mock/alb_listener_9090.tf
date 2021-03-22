# TARS Mock ALB Listener for port 8080
resource "aws_alb_listener" "tars-mock-9090" {
  load_balancer_arn = aws_alb.tars-alb-mock-private.arn
  port              = "9090"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = module.mock_fargate.lb_target_group_gov_gateway_private
  }
}


