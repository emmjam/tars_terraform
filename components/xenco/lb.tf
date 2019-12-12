resource "aws_lb" "xenco" {
  name = local.csi

  internal = "true"

  subnets = module.lb_subnets.subnet_ids

  load_balancer_type = "network"

  idle_timeout = "300"

  enable_deletion_protection = true

  tags = merge(
    local.default_tags,
    {
      "Name" = local.csi
    },
  )
}

