# ALB Listeners
resource "aws_alb_listener" "cpc-front-internal-9443" {
  load_balancer_arn = aws_alb.cpc-front-internal.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cpc-front-internal-9443.arn
  }
}

resource "aws_lb_listener_rule" "cpc-front-internal-9443-delegated" {
  listener_arn = aws_alb_listener.cpc-front-internal-9443.arn
  priority     = 90

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cpc-front-internal-9443.arn
  }

  condition {
    path_pattern {
      values = [
        "/delegated/*",
      ]
    }
  }
}

resource "aws_lb_listener_rule" "cpc-front-internal-9443-cpcode" {
  listener_arn = aws_alb_listener.cpc-front-internal-9443.arn
  priority     = 89

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cpc-front-internal-9443.arn
  }

  condition {
    path_pattern {
      values = [
        "/cpcode/*",
      ]
    }
  }
}

resource "aws_lb_listener_rule" "cpc-front-internal-9443-cpctrain" {
  listener_arn = aws_alb_listener.cpc-front-internal-9443.arn
  priority     = 88

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cpc-front-internal-9443.arn
  }

  condition {
    path_pattern {
      values = [
        "/cpctrain/*",
      ]
    }
  }
}

