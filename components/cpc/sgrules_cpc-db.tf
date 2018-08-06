# cpc to rds DB
resource "aws_security_group_rule" "oracle_db_ingress_cpc" {
  description              = "Allow TCP/1521 from CPC"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc-db.id}"
  source_security_group_id = "${module.cpc-back.security_group_id}"
}

# rds DB from jenkinsnode
resource "aws_security_group_rule" "oracle_db_ingress_jenkinsnode" {
  description       = "Allow TCP/1521 from jenkinsnode"
  type              = "ingress"
  from_port         = 1521
  to_port           = 1521
  protocol          = "tcp"
  security_group_id = "${aws_security_group.cpc-db.id}"
  source_security_group_id = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
}

# jenkinsnode to rds DB
resource "aws_security_group_rule" "jenkinsnode_egress_oracle_db" {
  description       = "Allow TCP/1521 to RDS"
  type              = "egress"
  from_port         = 1521
  to_port           = 1521
  protocol          = "tcp"
  security_group_id = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
  source_security_group_id = "${aws_security_group.cpc-db.id}"
}

# bastion to rds DB
resource "aws_security_group_rule" "oracle_db_ingress_bastion" {
  description              = "Allow TCP/1521 from Bastion"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc-db.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}

# bastion-rds
resource "aws_security_group_rule" "bastion_egress_rds_sg" {
  description       = "Allow TCP/1521 from Bastion to RDS"
  type              = "egress"
  from_port         = 1521
  to_port           = 1521
  protocol          = "tcp"
  security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
  source_security_group_id = "${aws_security_group.cpc-db.id}"
}