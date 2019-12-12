resource "aws_security_group" "outbound-oracle" {
  name        = "${local.csi}/outbound-oracle"
  description = "${local.csi}/outbound-oracle"
  vpc_id      = aws_vpc.ctrl.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/outbound-oracle"
    },
  )
}

