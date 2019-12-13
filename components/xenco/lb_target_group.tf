resource "aws_lb_target_group" "xenco" {
  name        = "${local.csi}-xenco"
  port        = "16385"
  protocol    = "TCP"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id
  target_type = "instance"

  health_check {
    port                = "traffic-port"
    protocol            = "TCP"
    healthy_threshold   = "3"
    unhealthy_threshold = "3"
    interval            = "10"
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-xenco"
    },
  )
}

