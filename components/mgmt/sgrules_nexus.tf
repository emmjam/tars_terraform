resource "aws_security_group_rule" "nexus_ingress_alb_public" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "${lookup(var.nexus_config, "listen_port")}"
  to_port                  = "${lookup(var.nexus_config, "listen_port")}"
  security_group_id        = "${module.microservice_nexus.security_group_id}"
  source_security_group_id = "${aws_security_group.alb_public.id}"
}

resource "aws_security_group_rule" "nexus_ingress_bastion_ssh" {
  type                     = "ingress"
  from_port                = "22"
  to_port                  = "22"
  protocol                 = "tcp"
  security_group_id        = "${module.microservice_nexus.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}

resource "aws_security_group_rule" "nexus_egress_internet_https" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = "${module.microservice_nexus.security_group_id}"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "nexus_egress_internet_http" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "80"
  to_port           = "80"
  security_group_id = "${module.microservice_nexus.security_group_id}"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

# Rule to permit access from nexus to EFS Mount Targets.
resource "aws_security_group_rule" "nexus_egress_nexus_efs_nfs" {
  type                     = "egress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${module.microservice_nexus.security_group_id}"
  source_security_group_id = "${aws_security_group.nexus_efs.id}"
}

/* We don't have one.. yet(?)
# This allows nexus to authenticate against OpenLDAP
resource "aws_security_group_rule" "nexus_egress_openldap_ldaps" {
  type                     = "egress"
  from_port                = "636"
  to_port                  = "636"
  protocol                 = "tcp"
  security_group_id        = "${module.microservice_nexus.security_group_id}"
  source_security_group_id = "${aws_security_group.lb_openldap.id}"
}
*/
