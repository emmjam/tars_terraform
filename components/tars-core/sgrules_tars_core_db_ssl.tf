# Oracle DB rules for MES
resource "aws_security_group_rule" "oracle_db_ingress_MES" {
  count         = "${length(var.mes_db_cidr_block) == 0 ? 0 : 1}"
  description              = "Allow MES Inbound"
  type                     = "ingress"
  from_port                = 2484
  to_port                  = 2484
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-db.id}"
  cidr_blocks = [
    "${var.mes_db_cidr_block}",
  ]
}

