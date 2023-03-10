# sftplus Server internal
resource "aws_lb" "mock-nlb" {
  name     = "${local.csi}-mock-nlb"
  internal = true

  subnets = data.terraform_remote_state.base.outputs.subnets_tars_backend

  load_balancer_type = "network"

  idle_timeout = "300"

  enable_deletion_protection = true

  enable_cross_zone_load_balancing = true

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-mock-nlb"
    },
  )
}

