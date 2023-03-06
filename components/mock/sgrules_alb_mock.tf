# TARS Private ALB mock rules
resource "aws_security_group_rule" "tars_alb_mock_ingress_tars_backend_port_8080" {
  description              = "Allow TCP/8080 from tars core backend"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-mock.id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-sg-id
}

resource "aws_security_group_rule" "tars_alb_mock_ingress_obs_port_8080" {
  description              = "Allow TCP/8080 from OBS"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-mock.id
  source_security_group_id = data.terraform_remote_state.obs.outputs.obs-sg-id
}

resource "aws_security_group_rule" "tars_alb_mock_egress_tars_mock_port_8080" {
  description              = "Allow TCP/8080 to tars core mock"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-mock.id
  source_security_group_id = aws_security_group.tars-mock.id
}

resource "aws_security_group_rule" "tars_alb_mock_ingress_cpc_back_port_8080" {
  description              = "Allow TCP/8080 from CPC Back"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-mock.id
  source_security_group_id = data.terraform_remote_state.cpc.outputs.cpc-back-sg-id
}

resource "aws_security_group_rule" "tars_alb_mock_ingress_cpc_batch_port_8080" {
  description              = "Allow TCP/8080 from CPC Batch"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-mock.id
  source_security_group_id = data.terraform_remote_state.cpc.outputs.cpc-batch-sg-id
}

resource "aws_security_group_rule" "tars_alb_mock_ingress_tars_frontend_port_8080" {
  description              = "Allow TCP/8080 from tars core frontend"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-mock.id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-frontend-sg-id
}

resource "aws_security_group_rule" "tars_alb_mock_ingress_tars_batch_port_8080" {
  description              = "Allow TCP/8080 from tars batch"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-mock.id
  source_security_group_id = data.terraform_remote_state.tars-batch.outputs.tars-batch-sg-id
}

resource "aws_security_group_rule" "tars_alb_private_egress_mock_epdq" {
  description              = "Allow TCP/443 to tars mock"
  type                     = "egress"
  from_port                = 8181
  to_port                  = 8181
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-mock.id
  source_security_group_id = module.mock_fargate.sg_epdq
}

resource "aws_security_group_rule" "mock_gov_gw_accounts_processor_ingress_443" {
  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0
  description = "Allow TCP/443 from mock gov gateway accounts processor lambda"
  type        = "ingress"

  protocol  = "tcp"
  from_port = 443
  to_port   = 443

  security_group_id        = aws_security_group.tars-alb-mock.id
  source_security_group_id = data.terraform_remote_state.base.outputs.lambda_mock_gov_gw_accounts_processor_sg_id
}

resource "aws_security_group_rule" "mock_gov_gw_accounts_processor_egress_443" {
  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0
  description = "Allow TCP/443 to mock gov gateway private alb"
  type        = "egress"

  protocol  = "tcp"
  from_port = 443
  to_port   = 443

  security_group_id        = data.terraform_remote_state.base.outputs.lambda_mock_gov_gw_accounts_processor_sg_id
  source_security_group_id = aws_security_group.tars-alb-mock.id
}
