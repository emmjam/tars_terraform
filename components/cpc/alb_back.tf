# CPC Back ALB
resource "aws_alb" "cpc-back" {
  name     = "${local.csi}-cpc-back"
  internal = true

  security_groups = [
    aws_security_group.cpc-back-alb.id,
  ]

  subnets = module.cpc-back.subnet_ids

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/cpc-back"
    },
  )
}

