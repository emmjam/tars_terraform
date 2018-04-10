# Oracle DB rules
resource "aws_security_group_rule" "oracle_db_ingress_tars_backend" {
  description              = "Allow TCP/1521 from tars core backend"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-db.id}"
  source_security_group_id = "${aws_security_group.tars-core-backend.id}"
}

resource "aws_security_group_rule" "oracle_db_ingress_tars_frontend" {
  description              = "Allow TCP/1521 from tars core frontend"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-db.id}"
  source_security_group_id = "${aws_security_group.tars-core-frontend.id}"
}

# rds DB from jenkinsnode
resource "aws_security_group_rule" "oracle_db_ingress_jenkinsnode" {
  description       = "Allow TCP/1521 from jenkinsnode"
  type              = "ingress"
  from_port         = 1521
  to_port           = 1521
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-core-db.id}"
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
  source_security_group_id = "${aws_security_group.tars-core-db.id}"
}
