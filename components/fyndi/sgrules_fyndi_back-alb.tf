resource "aws_security_group_rule" "fyndi-b-alb_ingress_public" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  security_group_id        = "${aws_security_group.fyndi-b-alb.id}"
  cidr_blocks              = ["${var.whitelist}"]
}

resource "aws_security_group_rule" "fyndi-b-jmeter_egress_jenkinsnode_1099_1101" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.fyndi-b-alb.id}"
  source_security_group_id = "${aws_security_group.fyndi-b.id}"
}

resource "aws_security_group_rule" "fyndi-b-alb_ingress_tars_batch" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  security_group_id        = "${aws_security_group.fyndi-b-alb.id}"
  source_security_group_id = "${aws_security_group.tars-batch.tars-batch-sg-id}"
}
