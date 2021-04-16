resource "aws_lb_target_group" "epdq-db" {
  name     = "${local.csi}-5432"
  port     = "5432"
  protocol = "TCP"
  vpc_id   = var.vpc_id

  health_check {
    port                = "traffic-port"
    protocol            = "TCP"
    healthy_threshold   = "3"
    unhealthy_threshold = "3"
    interval            = "10"
  }

  target_type = "ip"

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-epdq-db"
    },
  )
}