# SG for the TARS Public ALB
resource "aws_security_group" "tars_core_alb_public" {
  name        = "${local.csi}-tars-core-alb-public"
  description = "TARS Core ALB Public Facing"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/tars-core-alb-public"
    },
  )
}

