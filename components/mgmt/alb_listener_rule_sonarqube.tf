resource "aws_alb_listener_rule" "public_https_sonarqube" {
  listener_arn = aws_alb_listener.public_https.arn
  priority     = "3"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.sonarqube.arn
  }

  condition {
    field = "host-header"

    values = [
      aws_route53_record.sonarqube.fqdn,
    ]
  }
}

resource "aws_alb_listener_rule" "private_http_sonarqube" {
  listener_arn = aws_alb_listener.private_http.arn
  priority     = "3"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.sonarqube_private.arn
  }

  condition {
    field = "host-header"

    values = [
      aws_route53_record.sonarqube_private.fqdn,
    ]
  }
}

