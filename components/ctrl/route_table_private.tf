resource "aws_route_table" "private" {
  vpc_id = aws_vpc.ctrl.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/private"
    },
  )
}

