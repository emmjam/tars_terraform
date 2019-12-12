resource "aws_security_group" "fyndi_internal-alb" {
  name        = "${local.csi}/fyndi_internal-alb"
  description = "${local.csi}/fyndi_internal-alb"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/fyndi_internal-alb"
    },
  )
}

