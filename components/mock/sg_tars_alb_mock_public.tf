# SG for TARS mock ALB Public
resource "aws_security_group" "tars-alb-mock-public" {
  name        = "${local.csi}-tars-alb-mock-public"
  description = "TARS Mock ALB Public Facing"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-tars-alb-mock-public"
    },
  )
}

