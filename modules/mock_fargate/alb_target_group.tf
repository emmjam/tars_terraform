resource "aws_lb_target_group" "mock-epdq-8080" {
  name       = "${local.csi}-8080"
  port       = "8080"
  protocol   = "HTTP"
  vpc_id     = var.vpc_id
  target_type = "ip"
  slow_start = 300

  health_check {
    path                = "/"
    timeout             = 5
    interval            = 300
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }
}


