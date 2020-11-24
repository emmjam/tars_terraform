resource "aws_alb_listener_rule" "private_https_tars_api" {
  listener_arn = aws_alb_listener.tars-private-api-8443.arn
  priority     = "2"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tars-backend-api-8080.arn
  }

  condition {
    path_pattern {
      values = ["/tars-TarsRestWebServices/*"]
    }
  }
}

