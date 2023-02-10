resource "aws_security_group_rule" "cpc-front-alb_ingress_dvsa-443" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = aws_security_group.cpc-front-dvsa-alb.id

  cidr_blocks = [
    "10.0.0.0/8",
  ]
}

#additional sg rule to allow ingress port 1000 for sftpplus  from 10.0.0.1/32
resource "aws_security_group_rule" "cpc_ingress_rule" {
  type        = "ingress"
  from_port   = "1000"
  to_port     = "1000"
  protocol    = "tcp"
  cidr_blocks = ["10.0.0.1/32"]
  security_group_id = aws_security_group.cpc-front-dvsa-alb.id
}

resource "aws_security_group_rule" "cpc-front-alb_egress_cpc-front-8443" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8443"
  to_port                  = "8443"
  security_group_id        = aws_security_group.cpc-front-dvsa-alb.id
  source_security_group_id = module.cpc-front.security_group_id
}

