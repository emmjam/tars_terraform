resource "aws_alb_listener" "tars-internal-80" {
  load_balancer_arn = "${aws_alb.tars-internal.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.tars-frontend-8443.arn}"
  }
}

resource "aws_lb_listener_rule" "host_based_routing" {
  listener_arn = "${aws_alb_listener.tars-internal-80.arn}"
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.irdt-frontend-7443.arn}"
  }

  condition {
    field  = "host-header"

    values = [
      "${aws_route53_record.irdt-internal.fqdn}",
    ]
  }
}
