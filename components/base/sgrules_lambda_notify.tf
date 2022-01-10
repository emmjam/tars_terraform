resource "aws_security_group_rule" "squidnat_egress_govnotify" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  source_security_group_id = module.squidnat.security_group_id
  security_group_id        = module.lambda_notify.security_group_id
}


resource "aws_security_group_rule" "squidnat_egress_govnotify" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  source_security_group_id = aws_security_group.vpc_endpoints.id
  security_group_id        = module.lambda_notify.security_group_id
}
