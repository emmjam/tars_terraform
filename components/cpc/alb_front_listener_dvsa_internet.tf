# ALB Listeners
resource "aws_alb_listener" "cpc-front-dvsa-internet-8443" {
  load_balancer_arn = aws_alb.cpc-front-dvsa-internet.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.cpc_front_dvsa_internet.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cpc-front-dvsa-internet-8443.arn
  }
}

resource "aws_lb_listener_rule" "cpc-front-dvsa-internet-8443" {
  listener_arn = aws_alb_listener.cpc-front-dvsa-internet-8443.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cpc-front-dvsa-internet-8443.arn
  }

  condition {
    path_pattern {
      values = [
        "/cpctrain/*",
      ]
    }
  }
}

