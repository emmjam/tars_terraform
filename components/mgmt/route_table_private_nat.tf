resource "aws_route_table" "private_nat" {
  count  = length(var.nat_subnets_cidr)
  vpc_id = aws_vpc.mgmt.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/private-nat"
    },
  )
}

