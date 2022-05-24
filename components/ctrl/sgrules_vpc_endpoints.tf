resource "aws_security_group_rule" "vpc_endpoints_ingres_core" {
  type                     = "ingress"
  protocol                 = "all"
  from_port                = "-1"
  to_port                  = "-1"
  source_security_group_id = aws_security_group.core.id
  security_group_id        = aws_security_group.vpc_endpoints.id
}

