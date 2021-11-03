resource "aws_security_group_rule" "lambda_ingress_vpce" {
  description              = "Allow VPCE to lambda subnets"
  type                     = "egress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.api_lambda_sg.id
  cidr_blocks       = var.tars_lambda_subnets_cidrs
}

resource "aws_security_group_rule" "lambda_egress_vpce" {
  description              = "Allow VPCE from lambda subnets"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.api_lambda_sg.id
  cidr_blocks       = var.tars_lambda_subnets_cidrs
}
