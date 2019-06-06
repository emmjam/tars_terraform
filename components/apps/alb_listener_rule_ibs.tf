resource "aws_lb_listener_rule" "ibs-100" {
  listener_arn = "${aws_alb_listener.apps-8080.arn}"
  priority     = "100"

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.ibs-8080.arn}"
  }

  condition {
    field  = "host-header"
    values = ["${format("%s-%s-%s.%s","ibs",var.environment,"public",data.terraform_remote_state.acc.public_domain_name)}"]
  }
}

resource "aws_lb_listener_rule" "ibs-101" {
  listener_arn = "${aws_alb_listener.apps-8080.arn}"
  priority     = "101"

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.ibs-8080.arn}"
  }

  condition {
    field  = "host-header"
    values = ["driverpracticaltest.${data.terraform_remote_state.acc.public_domain_name}"]
  }
}
