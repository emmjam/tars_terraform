# Create the NAT gateway
resource "aws_nat_gateway" "tars" {
  count         = length(var.nat_subnets_cidrs)
  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(module.nat_subnets.subnet_ids, count.index)

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/nat"
    },
  )
}

