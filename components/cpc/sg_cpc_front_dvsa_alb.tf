resource "aws_security_group" "cpc-front-dvsa-alb" {
  name        = "${local.csi}/dvsa-alb"
  description = "${local.csi}/dvsa-alb"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/dvsa-alb"
    },
  )
}

