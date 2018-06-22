resource "aws_security_group_rule" "core_ingress_bastion_ssh" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "22"
  to_port                  = "22"
  security_group_id        = "${aws_security_group.core.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"

  depends_on = [
    "aws_vpc_peering_connection.ctrl"
  ]
}

resource "aws_security_group_rule" "core_egress_squidnat_https" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  security_group_id        = "${aws_security_group.core.id}"
  source_security_group_id = "${module.squidnat.security_group_id}"
}

resource "aws_security_group_rule" "core_egress_squidnat_http" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "80"
  to_port                  = "80"
  security_group_id        = "${aws_security_group.core.id}"
  source_security_group_id = "${module.squidnat.security_group_id}"
}

resource "aws_security_group_rule" "core_egress_s3_https" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = "${aws_security_group.core.id}"

  prefix_list_ids = [
    "${aws_vpc_endpoint.s3.prefix_list_id}",
  ]
}

resource "aws_security_group_rule" "core_egress_kms" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  security_group_id        = "${aws_security_group.core.id}"
  source_security_group_id = "${aws_security_group.kms_endpoint.id}"
}


# Jenkins Node ssh access 

resource "aws_security_group_rule" "core_ingress_jenkinsnode_ssh" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "22"
  to_port                  = "22"
  security_group_id        = "${aws_security_group.core.id}"
  source_security_group_id = "${module.jenkinsnode.security_group_id}"
}

resource "aws_security_group_rule" "core_egress_squidnat_explicit" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "3128"
  to_port                  = "3128"
  security_group_id        = "${aws_security_group.core.id}"
  source_security_group_id = "${module.squidnat.security_group_id}"
}

