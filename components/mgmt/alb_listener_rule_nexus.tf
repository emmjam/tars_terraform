resource "aws_alb_listener_rule" "public_https_nexus" {
  listener_arn = "${aws_alb_listener.public_https.arn}"
  priority     = "2"

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.nexus.arn}"
  }

  condition {
    field = "host-header"

    values = [
      "${aws_route53_record.nexus.fqdn}",
    ]
  }
}
