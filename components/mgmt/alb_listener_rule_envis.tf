resource "aws_alb_listener_rule" "public_https_envis" {
  listener_arn = aws_alb_listener.public_https.arn
  priority     = "4"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.envis.arn
  }

  condition {
    host_header {
      values = [
        aws_route53_record.envis.fqdn,
      ]
    }
  }
}

