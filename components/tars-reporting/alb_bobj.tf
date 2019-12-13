# ALB for TARS bobj
resource "aws_alb" "tars-alb-bobj-private" {
  name = format("%s-%s-%s", var.project, var.environment, "bobj")

  internal = false

  idle_timeout = 900

  security_groups = [
    aws_security_group.bobj-alb.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_alb_public

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/bobj-private"
    },
  )
}

