resource "aws_lb_target_group" "sftpplus_svr-10022-pub" {
  name        = "${local.csi}-10022-pub"
  port        = "10022"
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
      "Name" = "${local.csi}-10022-pub"
    },
  )
}

