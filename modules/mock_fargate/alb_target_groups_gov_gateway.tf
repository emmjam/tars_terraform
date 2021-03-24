resource "aws_lb_target_group" "mock_gov_gateway_9090_private" {
  name                 = "${local.csi}-090-gg-priv"
  port                 = "9090"
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  target_type          = "ip"
  slow_start           = 30
  deregistration_delay = 30

  health_check {
    path                = "/api/account/list"
    timeout             = 5
    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200,302"
  }
}

resource "aws_lb_target_group" "mock_gov_gateway_9090_public" {
  name                 = "${local.csi}-9090-gg-pub"
  port                 = "9090"
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  target_type          = "ip"
  slow_start           = 30
  deregistration_delay = 30

  health_check {
    path                = "/api/account/list"
    timeout             = 5
    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200,302"
  }
}

