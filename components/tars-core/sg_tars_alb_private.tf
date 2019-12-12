# SG for the TARS Public ALB
resource "aws_security_group" "tars-alb-private" {
  name        = "${local.csi}-tars-alb-private"
  description = "TARS ALB Public Facing"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/tars-alb-private"
    },
  )
}

