# TARS Messaging rules
resource "aws_security_group_rule" "tars_messaging_ingress_private_alb_port_8080" {
  description              = "Allow TCP/8080 from messaging private ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-messaging.id
  source_security_group_id = aws_security_group.tars-alb-messaging.id
}

resource "aws_security_group_rule" "tars_messaging_ingress_alb_port_80" {
  description              = "Allow TCP/80 from messaging private ALB"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-messaging.id
  source_security_group_id = aws_security_group.tars-alb-messaging.id
}

resource "aws_security_group_rule" "tars_messaging_egress_oracle_db" {
  description              = "Allow TCP/1521 to the Oracle DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-messaging.id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
}

resource "aws_security_group_rule" "tars_messaging_ingress_bastion" {
  description              = "Allow TCP/22 from bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-messaging.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

# TODO: peacheym: Too wide. TCP/443
resource "aws_security_group_rule" "tars_messaging_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = aws_security_group.tars-messaging.id
  source_security_group_id = data.terraform_remote_state.base.outputs.kms_sg_id
}

resource "aws_security_group_rule" "tars_messaging_egress_active_mq" {
  description              = "Allow TCP/61617 to AWS MQ"
  type                     = "egress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-messaging.id
  source_security_group_id = data.terraform_remote_state.base.outputs.awsmq_sg_id
}

# Allow RDP in from Bastion
resource "aws_security_group_rule" "tars_messaging_ingress_bastion_RDP" {
  description              = "Allow TCP/3389 from bastion"
  type                     = "ingress"
  from_port                = 3389
  to_port                  = 3389
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-messaging.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

resource "aws_security_group_rule" "tars_messaging_egress_tars_core_backend_alb_8080" {
  description              = "Allow TCP/8080 from messaging to tars core backend ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-messaging.id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
}

# Allow the messaging nodes to talk to Azure Monitoring Agent servers
resource "aws_security_group_rule" "tars_messaging_egress_internet_443" {
  description       = "Allow TCP/443 to internet"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.tars-messaging.id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

# windows messaging from jenkinsnode to support code/config deployments (SSH)
resource "aws_security_group_rule" "win_msg_ssh_ingress_jenkinsctrl" {
  description              = "Allow TCP/22 from Jenkinsctrl"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "22"
  to_port                  = "22"
  security_group_id        = aws_security_group.tars-messaging.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
}


