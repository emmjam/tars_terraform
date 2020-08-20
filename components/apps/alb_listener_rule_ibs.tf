#ibs1 ibs rule
resource "aws_lb_listener_rule" "ibs-100" {
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb_listener.apps-8080.arn
  priority     = "100"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ibs-80[0].arn
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

  condition {
    path_pattern {
    values = ["/*"]
    }
  }
}

#Normal Rule
resource "aws_lb_listener_rule" "ibs-101" {
  listener_arn = aws_alb_listener.apps-8080.arn
  priority     = "101"

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

#ibs1 ibs rule
resource "aws_lb_listener_rule" "ibs-102" {
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb_listener.apps-8080.arn
  priority     = "102"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ibs-80[0].arn
  }

  condition {
    field  = "host-header"
    values = ["driverpracticaltest.${data.terraform_remote_state.acc.outputs.public_domain_name}"]
  }
  condition {
    path_pattern {
    values = ["/*"]
    }
  }
}

#Normal Rule
resource "aws_lb_listener_rule" "ibs-103" {
  listener_arn = aws_alb_listener.apps-8080.arn
  priority     = "103"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ibs-8080.arn
  }

  condition {
    field  = "host-header"
    values = ["driverpracticaltest.${data.terraform_remote_state.acc.outputs.public_domain_name}"]
  }
}

#ibs1 ibs rule
resource "aws_lb_listener_rule" "ibs-104" {
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb_listener.apps-8080.arn
  priority     = "104"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ibs-80[0].arn
  }

  condition {
    field  = "host-header"
    values = ["driverpracticaltest.dvsa.gov.uk"]
  }

  condition {
    path_pattern {
    values = ["/*"]
    }
  }
}

#Normal Rule
resource "aws_lb_listener_rule" "ibs-105" {
  listener_arn = aws_alb_listener.apps-8080.arn
  priority     = "105"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ibs-8080.arn
  }

  condition {
    field  = "host-header"
    values = ["driverpracticaltest.dvsa.gov.uk"]
  }
}

#ibs1 ibs rule
resource "aws_lb_listener_rule" "ibs-106" {
  count        = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  listener_arn = aws_alb_listener.apps-8080.arn
  priority     = "106"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ibs-80[0].arn
  }

  condition {
    field = "host-header"
    values = [format(
      "%s-%s-%s.%s",
      "incapsula-ibs",
      var.environment,
      "public",
      data.terraform_remote_state.acc.outputs.public_domain_name,
    )]
  }

  condition {
    path_pattern {
    values = ["/*"]
    }
  }
}

#Normal Rule
resource "aws_lb_listener_rule" "ibs-107" {
  listener_arn = aws_alb_listener.apps-8080.arn
  priority     = "107"

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ibs-8080.arn
  }

  condition {
    field = "host-header"
    values = [format(
      "%s-%s-%s.%s",
      "incapsula-ibs",
      var.environment,
      "public",
      data.terraform_remote_state.acc.outputs.public_domain_name,
    )]
  }
}

