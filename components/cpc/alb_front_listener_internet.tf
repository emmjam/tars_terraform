# ALB Listeners
resource "aws_alb_listener" "cpc-front-internet-9443" {
  load_balancer_arn = "${aws_alb.cpc-front-internet.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = "${data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.cpc-front-internet-9443.arn}"
  }
}

resource "aws_lb_listener_rule" "cpc-front-internet-9443-delegated" {
  listener_arn = "${aws_alb_listener.cpc-front-internet-9443.arn}"
  priority     = 90

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.cpc-front-internet-9443.arn}"
  }

  condition {
    field  = "path-pattern"

    values = [
      "/delegated/*",
    ]
  }
}

resource "aws_lb_listener_rule" "cpc-front-internet-9443-cpcode" {
  listener_arn = "${aws_alb_listener.cpc-front-internet-9443.arn}"
  priority     = 89

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.cpc-front-internet-9443.arn}"
  }

  condition {
    field  = "path-pattern"

    values = [
      "/cpcode/*",
    ]
  }
}

resource "aws_lb_listener_rule" "cpc-front-internet-9443-cpctrain" {
  listener_arn = "${aws_alb_listener.cpc-front-internet-9443.arn}"
  priority     = 88

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.cpc-front-internet-9443.arn}"
  }

  condition {
    field  = "path-pattern"

    values = [
      "/cpctrain/*",
    ]
  }
}
