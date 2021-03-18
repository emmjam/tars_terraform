resource "aws_lb_listener_rule" "epdq-public" {
  listener_arn = aws_alb_listener.tars-mock-443.arn
  priority     = "101"

  action {
    type             = "forward"
    target_group_arn = module.mock_fargate.lb_target_group_epdq-public
  }

  condition {
    host_header {
      values = ["mock-epdq-${var.environment}-public.${data.terraform_remote_state.acc.outputs.public_domain_name}"]
    }
  }
}

