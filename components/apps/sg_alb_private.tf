resource "aws_security_group" "private-alb" {
  name        = "${local.csi}/private-alb"
  description = "${local.csi}/private-alb"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/private-alb"
    },
  )
}


