# ALB Listeners
resource "aws_alb_listener" "cpc-front-dva-7443" {
  load_balancer_arn = aws_alb.cpc-front-dva.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = data.aws_acm_certificate.cpc_tars_dvsacloud_uk.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cpc-front-dva-7443.arn
  }
}

resource "aws_lb_listener_rule" "cpc-front-dva-7443" {
  listener_arn = aws_alb_listener.cpc-front-dva-7443.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cpc-front-dva-7443.arn
  }

  condition {
    path_pattern {
      values = [
        "/cpctrain/*",
      ]
    }
  }
}

