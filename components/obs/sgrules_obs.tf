resource "aws_security_group_rule" "obs-ingress-obs-alb-8080" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.obs.id}"
  source_security_group_id = "${aws_security_group.obs-alb.id}"
}

resource "aws_security_group_rule" "obs-egress-tars-back-8080" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.obs.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
}

resource "aws_security_group_rule" "obs-ingress-tars-back-8080" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
  source_security_group_id = "${aws_security_group.obs.id}"
}

resource "aws_security_group_rule" "obs_egress_oracle_db" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "1521"
  to_port                  = "1521"
  security_group_id        = "${aws_security_group.obs.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
}



