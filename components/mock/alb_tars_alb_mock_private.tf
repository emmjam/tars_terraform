# TARS Mock Private ALB
resource "aws_alb" "tars-alb-mock-private" {
  name = "${local.csi}-mock-private"

  internal = true

  security_groups = [
    aws_security_group.tars-alb-mock.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_tars_backend

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-mock-private"
    },
  )
}

