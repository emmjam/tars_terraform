# CPC FRONT DVA ALB
resource "aws_alb" "cpc-front-dva" {
  name         = "${local.csi}-dva"
  internal     = false
  idle_timeout = 300

  security_groups = [
    aws_security_group.cpc-front-dva-alb.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_alb_public

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/dva"
    },
  )
}

