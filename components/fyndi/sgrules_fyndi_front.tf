resource "aws_security_group_rule" "fyndi-f-ingress-fyndi-f-alb-8080" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.fyndi-f.id}"
  source_security_group_id = "${aws_security_group.fyndi-f-alb.id}"
}

resource "aws_security_group_rule" "fyndi-f-egress-fyndi-f-rds-3306" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "3306"
  to_port                  = "3306"
  security_group_id        = "${aws_security_group.fyndi-f.id}"
  source_security_group_id = "${data.terraform_remote_state.ibs.ibs_aurora_sg_id}"
}

resource "aws_security_group_rule" "fyndi-f-egress-tars-backend-8080" {
  description              = "Allow TCP/8080 to TARS Backend"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.fyndi-f.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
}

resource "aws_security_group_rule" "fyndi-f-ingress-tars-backend-8080" {
  description              = "Allow TCP/8080 from fyndi-f"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
  source_security_group_id = "${aws_security_group.fyndi-f.id}"
}

resource "aws_security_group_rule" "fyndi-f-egress-tars-core-8080" {
  description              = "Allow TCP/8080 to TARS Backend"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.fyndi-f.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-batch.tars-batch-sg-id}"
}

resource "aws_security_group_rule" "fyndi-f-ingress-tars-core-8080" {
  description              = "Allow TCP/8080 from fyndi-f"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${data.terraform_remote_state.tars-batch.tars-batch-sg-id}"
  source_security_group_id = "${aws_security_group.fyndi-f.id}"
}
