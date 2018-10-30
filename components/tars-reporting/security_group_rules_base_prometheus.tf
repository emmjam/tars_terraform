resource "aws_security_group_rule" "prometheus_egress_rsis_rds" {
  description              = "Allow TCP/1521 from Prometheus to RSIS"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.prometheus_sg_id}"
  source_security_group_id = "${aws_security_group.tars-rsis-db.id}"
}

resource "aws_security_group_rule" "prometheus_egress_oracle_mis" {
  description              = "Allow TCP/1521 from Prometheus to MISDB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.prometheus_sg_id}"
  source_security_group_id = "${aws_security_group.tars-mis-db.id}"
}
