resource "aws_lb_listener_rule" "epdq" {
  listener_arn = aws_alb_listener.tars-mock-8080.arn
  priority     = "101"

  action {
    type             = "forward"
    target_group_arn = module.mock_fargate.lb_target_group_epdq
  }

  condition {
    field  = "host-header"
    values = ["mock-epdq.${local.vpc_domain_name}", "mock-epdq"]
  }
}

