resource "aws_security_group_rule" "ldap_elb_egress_ldap_ldap" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "389"
  to_port                  = "389"
  security_group_id        = "${aws_security_group.ldap_elb.id}"
  source_security_group_id = "${module.microservice_ldap.security_group_id}"
}

resource "aws_security_group_rule" "ldap_elb_ingress_bastion_ldap" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "389"
  to_port                  = "389"
  security_group_id        = "${aws_security_group.ldap_elb.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}