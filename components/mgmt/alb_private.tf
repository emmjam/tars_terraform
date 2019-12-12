resource "aws_alb" "private" {
  name     = "${local.csi}-private"
  internal = "true"

  enable_cross_zone_load_balancing = true
  enable_http2                     = true

  security_groups = [
    aws_security_group.alb_private.id,
  ]

  subnets = module.nat_subnets.subnet_ids

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-private"
    },
  )
}

