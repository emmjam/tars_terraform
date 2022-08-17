resource "aws_security_group" "r53_endpoint" {
  name        = "${local.csi}-r53-endpoint"
  description = "${local.csi}-r53-endpoint"
  vpc_id      = aws_vpc.mgmt.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-r53-endpoint"
    },
  )
}

resource "aws_security_group_rule" "r53_endpoint_in_tcp" {
  type                     = "ingress"
  from_port                = "53"
  to_port                  = "53"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.r53_endpoint.id
  cidr_blocks              = var.whitelist
}

resource "aws_security_group_rule" "r53_endpoint_in_udp" {
  type                     = "ingress"
  from_port                = "53"
  to_port                  = "53"
  protocol                 = "udp"
  security_group_id        = aws_security_group.r53_endpoint.id
  cidr_blocks              = var.whitelist
}

resource "aws_security_group_rule" "r53_endpoint_out_tcp" {
  type                     = "egress"
  from_port                = "53"
  to_port                  = "53"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.r53_endpoint.id
  cidr_blocks              = var.whitelist
}

resource "aws_security_group_rule" "r53_endpoint_out_udp" {
  type                     = "egress"
  from_port                = "53"
  to_port                  = "53"
  protocol                 = "udp"
  security_group_id        = aws_security_group.r53_endpoint.id
  cidr_blocks              = var.whitelist
}