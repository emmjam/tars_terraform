resource "aws_internet_gateway" "ctrl" {
  vpc_id = aws_vpc.ctrl.id

  tags = merge(
    local.default_tags,
    {
      "Name" = local.csi
    },
  )
}

