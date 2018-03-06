# TARS Core backend rules
resource "aws_security_group_rule" "tars_core_backend_ingress_private_alb_port_9990" {
  description              = "Allow TCP/9990 from backend private ALB"
  type                     = "ingress"
  from_port                = 9990
  to_port                  = 9990
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-backend.id}"
  source_security_group_id = "${aws_security_group.tars-alb-backend.id}"
}

resource "aws_security_group_rule" "tars_core_backend_ingress_private_alb_port_8080" {
  description              = "Allow TCP/8080 from backend private ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-backend.id}"
  source_security_group_id = "${aws_security_group.tars-alb-backend.id}"
}

resource "aws_security_group_rule" "tars_core_backend_egress_oracle_db" {
  description              = "Allow TCP/1521 to the Oracle DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-backend.id}"
  source_security_group_id = "${aws_security_group.tars-core-db.id}"
}

resource "aws_security_group_rule" "tars_core_backendend_ingress_bastion" {
  count                    = "${length(var.mgmt_bastion_subnets)}"
  description              = "Allow TCP/22 from bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-backend.id}"
  cidr_blocks              = ["${element(var.mgmt_bastion_subnets,count.index)}"]
}