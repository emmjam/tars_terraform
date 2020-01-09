resource "aws_security_group_rule" "core_egress_s3_https" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = aws_security_group.core.id

  prefix_list_ids = [
    aws_vpc_endpoint.s3.prefix_list_id,
  ]
}

resource "aws_security_group_rule" "core_egress_vpc_endpoints" {
  type                     = "egress"
  protocol                 = "all"
  from_port                = "-1"
  to_port                  = "-1"
  security_group_id        = aws_security_group.core.id
  source_security_group_id = aws_security_group.vpc_endpoints.id
}

