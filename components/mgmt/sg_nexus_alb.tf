resource "aws_security_group" "nexus_alb" {
  name        = "${local.csi}-nexus-alb"
  description = "${local.csi}-nexus-alb"
  vpc_id      = aws_vpc.mgmt.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-nexus-alb"
    },
  )
}

