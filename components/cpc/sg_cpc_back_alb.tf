resource "aws_security_group" "cpc-back-alb" {
  name        = "${local.csi}/cpc-back-alb"
  description = "${local.csi}/cpc-back-alb"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/cpc-back-alb"
    },
  )
}

