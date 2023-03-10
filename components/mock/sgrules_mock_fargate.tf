resource "aws_security_group_rule" "tars_alb_private_ingress_mock_epdq" {
  description              = "Fargate mock ingress TCP/8080 from mock ALB"
  type                     = "ingress"
  from_port                = 8181
  to_port                  = 8181
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock.id
  security_group_id        = module.mock_fargate.sg_epdq
}

resource "aws_security_group_rule" "tars_backend_egress_tars_alb_mock2_port_8181" {
  description              = "TARS Back egress TCP/8181 to Fargate mock"
  type                     = "egress"
  from_port                = 8181
  to_port                  = 8181
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-sg-id
  source_security_group_id = module.mock_fargate.sg_epdq
}

resource "aws_security_group_rule" "tars_backend_ingress_tars_alb_mock2_port_8181" {
  description              = "Fargate mock ingress TCP/8181 from TARS back"
  type                     = "ingress"
  from_port                = 8181
  to_port                  = 8181
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-sg-id
  security_group_id        = module.mock_fargate.sg_epdq
}

resource "aws_security_group_rule" "tars_alb_public_ingress_mock_epdq" {
  description              = "Fargate Mock ingress TCP/8080 from mock ALB"
  type                     = "ingress"
  from_port                = 8181
  to_port                  = 8181
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock-public.id
  security_group_id        = module.mock_fargate.sg_epdq
}

resource "aws_security_group_rule" "tars_back_egress_mock_epdq" {
  description              = "Fargate mock egress TCP/8080 to TARS backend ALBs"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  security_group_id        = module.mock_fargate.sg_epdq
}

resource "aws_security_group_rule" "tars_back_alb_ingress_mock_epdq" {
  description              = "TARS Backend ALBs ingress TCP/8080 from Fargate mock"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  source_security_group_id = module.mock_fargate.sg_epdq
}

resource "aws_security_group_rule" "mock_gov_gateway_ingress_mock_alb" {
  description              = "Fargate mock ingress TCP/9090 from Mock ALB"
  type                     = "ingress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock.id
  security_group_id        = module.mock_fargate.sg_gov_gateway
}

resource "aws_security_group_rule" "mock_alb_egress_mock_gov_gateway" {
  description              = "Mock ALB egress TCP/9090 to gov gateway"
  type                     = "egress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  source_security_group_id = module.mock_fargate.sg_gov_gateway
  security_group_id        = aws_security_group.tars-alb-mock.id
}

resource "aws_security_group_rule" "mock_public_alb_egress_mock_fargate" {
  description              = "Mock public ALB egress TCP/9090 to mock fargate"
  type                     = "egress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  source_security_group_id = module.mock_fargate.sg_gov_gateway
  security_group_id        = aws_security_group.tars-alb-mock-public.id
}

resource "aws_security_group_rule" "mock_fargate_ingress_mock_public_alb" {
  description              = "Fargate Mock ingress TCP/9090 from mock public ALB"
  type                     = "ingress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock-public.id
  security_group_id        = module.mock_fargate.sg_gov_gateway
}

resource "aws_security_group_rule" "cpc_egress_mock_alb" {
  description              = "CPC egress TCP/9090 to gov gateway"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock.id
  security_group_id        = data.terraform_remote_state.cpc.outputs.cpc-front-sg-id
}

resource "aws_security_group_rule" "mock_alb_ingress_cpc" {
  description              = "Mock ALB egress TCP/9090 from CPC"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.cpc.outputs.cpc-front-sg-id
  security_group_id        = aws_security_group.tars-alb-mock.id
}

resource "aws_security_group_rule" "obs_egress_mock_alb" {
  description              = "OBS egress TCP/9090 to gov gateway"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock.id
  security_group_id        = data.terraform_remote_state.apps.outputs.obs-sg-id
}

resource "aws_security_group_rule" "mock_alb_ingress_obs" {
  description              = "Mock ALB ingress TCP/9090 from OBS"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.apps.outputs.obs-sg-id
  security_group_id        = aws_security_group.tars-alb-mock.id
}

resource "aws_security_group_rule" "jenkinsnode_egress_mock_epdq" {
  description              = "jenkinsnode egress TCP/5432 to Mock EPDQ"
  type                     = "egress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
  source_security_group_id = module.mock_fargate.sg_epdq_db
}

resource "aws_security_group_rule" "mock_epdq_ingress_jenkinsnode" {
  description              = "Mock EPDQ ingress TCP/5432 from jenkinsnode"
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = module.mock_fargate.sg_epdq_db
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
}

resource "aws_security_group_rule" "jenkinsnode_egress_mock_nlb" {
  description       = "jenkinsnode egress TCP/5432 to mock NLB"
  type              = "egress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  security_group_id = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
  cidr_blocks       = [for subnet in data.aws_subnet.tars_backend : subnet.cidr_block]
}

resource "aws_security_group_rule" "epdq_egress_epdq_db" {
  description              = "epdq egress TCP/5432 to epdq-db"
  type                     = "egress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = module.mock_fargate.sg_epdq
  source_security_group_id = module.mock_fargate.sg_epdq_db
}

resource "aws_security_group_rule" "epdq_db_ingress_epdq" {
  description              = "epdq-db egress TCP/5432 from epdq"
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = module.mock_fargate.sg_epdq_db
  source_security_group_id = module.mock_fargate.sg_epdq
}

# Entire CIDR ranges of subnets containing NLB required for healthchecking Fargate
resource "aws_security_group_rule" "mock_epdq_ingress_mock_nlb" {
  description       = "Mock EPDQ ingress TCP/5432 from mock NLB"
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  security_group_id = module.mock_fargate.sg_epdq_db
  cidr_blocks       = [for subnet in data.aws_subnet.tars_backend : subnet.cidr_block]
}

resource "aws_security_group_rule" "bastion_egress_epdq_db" {
  description              = "Bastion egress TCP/5432 to epdq"
  type                     = "egress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
  source_security_group_id = module.mock_fargate.sg_epdq
}

resource "aws_security_group_rule" "epdq_db_ingress_bastion" {
  description              = "Mock EPDQ ingress TCP/5432 from bastion"
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = module.mock_fargate.sg_epdq
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

resource "aws_security_group_rule" "bastion_egress_mock_nlb" {
  description       = "bastion egress TCP/5432 to mock NLB"
  type              = "egress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
  cidr_blocks       = [for subnet in data.aws_subnet.tars_backend : subnet.cidr_block]
}