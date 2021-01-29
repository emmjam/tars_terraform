resource "aws_alb_listener_rule" "jenkins" {
  listener_arn = aws_alb_listener.public_https.arn
  priority     = "1"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.jenkins.arn
  }

  condition {
    host_header {
      values = [
        aws_route53_record.jenkins.fqdn,
      ]
    }
  }
}

