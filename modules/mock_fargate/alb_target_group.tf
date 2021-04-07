resource "aws_lb_target_group" "mock-epdq-8080-private" {
  name                 = "${local.csi}-8080-private"
  port                 = "8080"
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  target_type          = "ip"
  slow_start           = 30
  deregistration_delay = 30

  health_check {
    path                = "/"
    timeout             = 5
    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }

  tags = var.default_tags
}

resource "aws_lb_target_group" "mock-epdq-8080-public" {
  name                 = "${local.csi}-8080-public"
  port                 = "8080"
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  target_type          = "ip"
  slow_start           = 30
  deregistration_delay = 30

  health_check {
    path                = "/"
    timeout             = 5
    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }

  tags = var.default_tags
}


