resource "aws_security_group_rule" "cpc-front-ingress-cpc-front-internal-alb-9443" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "9443"
  to_port                  = "9443"
  security_group_id        = module.cpc-front.security_group_id
  source_security_group_id = aws_security_group.cpc-front-internal-alb.id
}

resource "aws_security_group_rule" "cpc-front-ingress-tars-public-alb-9443" {
  # Removing Apache  -- IanD
  description              = "Inbound TCP/9443 from public apache alb"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "9443"
  to_port                  = "9443"
  security_group_id        = module.cpc-front.security_group_id
  #source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-public-alb-sg-id
  source_security_group_id = aws_security_group.cpc-front-dva-alb.id
}

resource "aws_security_group_rule" "cpc-front-ingress-cpc-front-dvs-alb-7443" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "7443"
  to_port                  = "7443"
  security_group_id        = module.cpc-front.security_group_id
  source_security_group_id = aws_security_group.cpc-front-dva-alb.id
}

resource "aws_security_group_rule" "cpc-front-ingress-cpc-front-dvsa-alb-8443" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8443"
  to_port                  = "8443"
  security_group_id        = module.cpc-front.security_group_id
  source_security_group_id = aws_security_group.cpc-front-dvsa-alb.id
}

resource "aws_security_group_rule" "cpc-front-ingress-cpc-front-dvsa-internet-alb-8443" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8443"
  to_port                  = "8443"
  security_group_id        = module.cpc-front.security_group_id
  source_security_group_id = aws_security_group.cpc-front-dvsa-internet-alb.id
}

resource "aws_security_group_rule" "cpc-front-egress-cpc-back-alb-8080" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = module.cpc-front.security_group_id
  source_security_group_id = aws_security_group.cpc-back-alb.id
}

resource "aws_security_group_rule" "cpc-front_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = module.cpc-front.security_group_id
  source_security_group_id = data.terraform_remote_state.base.outputs.kms_sg_id
}

resource "aws_security_group_rule" "cpc-front-egress-tars-back-alb-8080" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = module.cpc-front.security_group_id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
}

