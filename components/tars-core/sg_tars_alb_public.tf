resource "aws_security_group" "tars_alb_public" {
  name        = "${local.csi}-tars-alb-public"
  description = "TARS ALB Public Facing"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/tars-alb-public"
    },
  )
}

