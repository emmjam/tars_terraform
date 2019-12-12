resource "aws_vpc" "ctrl" {
  cidr_block           = var.ctrl_vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = merge(
    local.default_tags,
    {
      "Name" = local.csi
    },
  )
}

