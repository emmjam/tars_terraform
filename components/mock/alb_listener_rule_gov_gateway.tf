resource "aws_lb_listener_rule" "gov_gateway_private" {
  listener_arn = aws_alb_listener.tars-mock-9090.arn
  priority     = "102"

  action {
    type             = "forward"
    target_group_arn = module.mock_fargate.lb_target_group_gov_gateway_private
  }

  condition {
    host_header {
      values = ["mock-gov-gateway.${local.vpc_domain_name}"]
    }
  }
}

resource "aws_lb_listener_rule" "gov_gateway_public" {
  listener_arn = aws_alb_listener.tars-mock-443.arn
  priority     = "102"

  action {
    type             = "forward"
    target_group_arn = module.mock_fargate.lb_target_group_gov_gateway_public
  }

  condition {
    host_header {
      values = ["mock-gov-gateway-${var.environment}-public.${data.terraform_remote_state.acc.outputs.public_domain_name}"]
    }
  }
}

