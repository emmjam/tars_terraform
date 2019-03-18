resource "aws_security_group_rule" "ldap_ingress_bastion_ssh" {
  type                     = "ingress"
  from_port                = "22"
  to_port                  = "22"
  protocol                 = "tcp"
  security_group_id        = "${module.microservice_ldap.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}

resource "aws_security_group_rule" "ldap_ingress_elb" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "389"
  to_port                  = "389"
  security_group_id        = "${module.microservice_ldap.security_group_id}"
  source_security_group_id = "${aws_security_group.ldap_elb.id}"
}
