resource "aws_security_group_rule" "obs-alb_ingress_public" {
  type                      = "ingress"
  protocol                  = "tcp"
  from_port                 = "80"
  to_port                   = "80"
  security_group_id         = "${aws_security_group.obs-alb.id}"
  source_security_group_id  = "${data.terraform_remote_state.tars-core.tars-core-apache-sg-id}" 
}

resource "aws_security_group_rule" "jmeter_egress_jenkinsnode_1099_1101" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.obs-alb.id}"
  source_security_group_id = "${aws_security_group.obs.id}"
}
