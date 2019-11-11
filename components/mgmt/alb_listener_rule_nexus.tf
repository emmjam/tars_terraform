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

resource "aws_alb_listener_rule" "private_http_nexus" {
  listener_arn = "${aws_alb_listener.private_http.arn}"
  priority     = "2"

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.nexus_private.arn}"
  }

  condition {
    field = "host-header"

    values = [
      "${aws_route53_record.nexus_private.fqdn}",
    ]
  }
}

resource "aws_alb_listener_rule" "private_https_nexus" {
  listener_arn = "${aws_alb_listener.private_https.arn}"
  priority     = "1"

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.nexus_private.arn}"
  }

  condition {
    field = "host-header"

    values = [
      "${aws_route53_record.nexus_private.fqdn}",
    ]
  }
}
