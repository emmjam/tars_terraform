resource "aws_security_group" "mgmt" {
  name        = "${local.csi}-mgmt"
  description = "Common SG for everything in MGMT environment"
  vpc_id      = aws_vpc.mgmt.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-mgmt"
    },
  )
}

