resource "aws_nat_gateway" "mgmt" {
  count         = length(var.nat_subnets_cidr)
  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(module.natgw_subnets.subnet_ids, count.index)

  tags = merge(
    local.default_tags,
    {
      "Name" = local.csi
    },
  )
}

