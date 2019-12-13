resource "aws_security_group" "bobj-alb" {
  name        = "${local.csi}/bobj-alb"
  description = "${local.csi}/bobj-alb"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/bobj-alb"
    },
  )
}

