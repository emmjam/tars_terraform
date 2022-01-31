resource "aws_security_group_rule" "alb_xe_8443" {
  count = var.reporting_xe_count
  security_group_id = aws_security_group.reporting_xe_alb[count.index].id
  description       = "Allow TCP/8443 from Whitelist"
  type              = "ingress"

  protocol  = "tcp"
  from_port = 8443
  to_port   = 8443

  cidr_blocks = var.reporting_xe_alb_sg_whitelist_hosts
}

resource "aws_security_group_rule" "reporting_alb_egress_8443" {
  count = var.reporting_xe_count
  security_group_id = aws_security_group.reporting_xe_alb[count.index].id
  description       = "Allow TCP/8443 to Reporting-XE instance"
  type              = "egress"

  protocol  = "tcp"
  from_port = 8443
  to_port   = 8443

  source_security_group_id = module.microservice_reporting_xe[count.index].security_group_id
}

resource "aws_security_group_rule" "reporting_xe_8443" {
  count = var.reporting_xe_count
  type                     = "ingress"
  description              = "Allow TCP/8443 from ALB"
  protocol                 = "tcp"
  from_port                = 8443
  to_port                  = 8443
  security_group_id        = module.microservice_reporting_xe[count.index].security_group_id
  source_security_group_id = aws_security_group.reporting_xe_alb[count.index].id
}