resource "aws_internet_gateway" "mgmt" {
  vpc_id = aws_vpc.mgmt.id

  tags = merge(
    local.default_tags,
    {
      "Name" = local.csi
    },
  )
}

