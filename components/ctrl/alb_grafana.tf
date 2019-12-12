resource "aws_alb" "grafana" {
  name     = "${local.csi}-grafana"
  internal = "false"

  security_groups = [
    aws_security_group.grafana_alb.id,
  ]

  subnets = module.grafana_alb_subnets.subnet_ids

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-grafana"
    },
  )
}

