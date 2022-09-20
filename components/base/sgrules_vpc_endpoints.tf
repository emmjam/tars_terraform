resource "aws_security_group_rule" "vpc_endpoints_ingres_core" {
  type                     = "ingress"
  protocol                 = "all"
  from_port                = "-1"
  to_port                  = "-1"
  source_security_group_id = aws_security_group.core.id
  security_group_id        = aws_security_group.vpc_endpoints.id
}

resource "aws_security_group_rule" "vpc_endpoints_ingres_govnotify" {
  type                     = "ingress"
  protocol                 = "all"
  from_port                = "-1"
  to_port                  = "-1"
  source_security_group_id = module.lambda_notify.security_group_id
  security_group_id        = aws_security_group.vpc_endpoints.id
}

resource "aws_security_group_rule" "vpc_endpoints_ingress_mock_gov_gw_accounts_processor" {
  count                    = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  type                     = "ingress"
  protocol                 = "all"
  from_port                = "-1"
  to_port                  = "-1"
  source_security_group_id = module.lambda_mock_gov_gw_accounts_processor[count.index].security_group_id
  security_group_id        = aws_security_group.vpc_endpoints.id
}

resource "aws_security_group_rule" "vpce_egress_mock_gov_gw_accounts_processor" {
  count                    = var.mock_gov_gw_accounts_processor == true ? 1 : 0

  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  source_security_group_id = aws_security_group.vpc_endpoints.id
  security_group_id        = module.lambda_mock_gov_gw_accounts_processor[count.index].security_group_id
}
