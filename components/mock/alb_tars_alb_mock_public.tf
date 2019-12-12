# TARS Mock Public ALB
resource "aws_alb" "tars-alb-mock-public" {
  name = "${local.csi}-mock-public"

  internal = false

  security_groups = [
    aws_security_group.tars-alb-mock-public.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_alb_public

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-mock-public"
    },
  )
}

