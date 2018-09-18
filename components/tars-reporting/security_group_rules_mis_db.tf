# Oracle DB rules

resource "aws_security_group_rule" "mis_rds_ingress_dvsa-1521" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "1521"
  to_port                  = "1521"
  security_group_id        = "${aws_security_group.tars-mis-db.id}"
  cidr_blocks              = ["10.0.0.0/8"]
}

# rds DB from jenkinsnode
resource "aws_security_group_rule" "mis_rds_ingress_jenkinsnode" {
  description       = "Allow TCP/1521 from jenkinsnode"
  type              = "ingress"
  from_port         = "1521"
  to_port           = "1521"
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-mis-db.id}"
  source_security_group_id = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
}

# jenkinsnode to rds DB
resource "aws_security_group_rule" "jenkinsnode_egress_mis_rds" {
  description       = "Allow TCP/1521 to RDS"
  type              = "egress"
  from_port         = "1521"
  to_port           = "1521"
  protocol          = "tcp"
  security_group_id = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
  source_security_group_id = "${aws_security_group.tars-mis-db.id}"
}

# bastion to rds DB
resource "aws_security_group_rule" "mis_rds_ingress_bastion" {
  description              = "Allow TCP/1521 from Bastion"
  type                     = "ingress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-mis-db.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}

# bastion-rds
resource "aws_security_group_rule" "bastion_egress_mis_rds_sg" {
  description       = "Allow TCP/1521 from Bastion to RDS"
  type              = "egress"
  from_port         = "1521"
  to_port           = "1521"
  protocol          = "tcp"
  security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
  source_security_group_id = "${aws_security_group.tars-mis-db.id}"
}

# MIS DB to TARS DB (MV pull)
resource "aws_security_group_rule" "mis_rds_egress_tarsdb_sg" {
  description       = "Allow TCP/1521 from MISDB"
  type              = "egress"
  from_port         = "1521"
  to_port           = "1521"
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-mis-db.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
}
resource "aws_security_group_rule" "oracle_db_ingress_mis_rds" {
  description              = "Allow TCP/1521 from MISDB to TARSDB"
  type                     = "ingress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
  source_security_group_id = "${aws_security_group.tars-mis-db.id}"
}

# MIS to tars backend for PAN encryption
resource "aws_security_group_rule" "oracle_mis_egress_tars_backend" {
  description              = "Allow TCP/8080 from MISDB to TARS BACKEND"
  type                     = "egress"
  from_port                = "8080"
  to_port                  = "8080"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-mis-db.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
}

resource "aws_security_group_rule" "tars_backend_ingress_oracle_mis" {
  description              = "Allow TCP/8080 from MISDB to TARS BACKEND"
  type                     = "ingress"
  from_port                = "8080"
  to_port                  = "8080"
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
  source_security_group_id = "${aws_security_group.tars-mis-db.id}"
}
