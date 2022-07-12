resource "aws_alb_listener_rule" "reporting_xe_apex" {
  count        = var.reporting_xe_count
  listener_arn = aws_alb_listener.reporting_xe_8443[count.index].arn
  priority     = "100"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.reporting_xe_8443[count.index].arn
  }

  condition {
    path_pattern {
      values = ["/apex*"]
    }
  }
}

resource "aws_alb_listener_rule" "reporting_xe_i212" {
  count        = var.reporting_xe_count
  listener_arn = aws_alb_listener.reporting_xe_8443[count.index].arn
  priority     = "200"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.reporting_xe_8443[count.index].arn
  }

  condition {
    path_pattern {
      values = ["/212/*"]
    }
  }
}
