resource "aws_lb_listener_rule" "ibs-100" {
  listener_arn = aws_alb_listener.apps-8080.arn
  priority     = "100"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ibs-8080.arn
  }

  condition {
    field = "host-header"
    # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
    # force an interpolation expression to be interpreted as a list by wrapping it
    # in an extra set of list brackets. That form was supported for compatibility in
    # v0.11, but is no longer supported in Terraform v0.12.
    #
    # If the expression in the following list itself returns a list, remove the
    # brackets to avoid interpretation as a list of lists. If the expression
    # returns a single list item then leave it as-is and remove this TODO comment.
    values = [format(
      "%s-%s-%s.%s",
      "ibs",
      var.environment,
      "public",
      data.terraform_remote_state.acc.outputs.public_domain_name,
    )]
  }
}

resource "aws_lb_listener_rule" "ibs-101" {
  listener_arn = aws_alb_listener.apps-8080.arn
  priority     = "101"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ibs-8080.arn
  }

  condition {
    field  = "host-header"
    values = ["driverpracticaltest.${data.terraform_remote_state.acc.outputs.public_domain_name}"]
  }
}

resource "aws_lb_listener_rule" "ibs-102" {
  listener_arn = aws_alb_listener.apps-8080.arn
  priority     = "102"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ibs-8080.arn
  }

  condition {
    field  = "host-header"
    values = ["driverpracticaltest.dvsa.gov.uk"]
  }
}

