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

# This rule is required for the DVSA AD DNS Servers
resource "aws_security_group_rule" "core_egress_dns" {
  type                     = "egress"
  protocol                 = "udp"
  from_port                = "53"
  to_port                  = "53"
  security_group_id        = "${aws_security_group.core.id}"

  # TODO: peacheym: Parameterise this list
  cidr_blocks = [
    "10.166.0.14/32",
    "10.166.0.28/32",
    "10.166.0.43/32",
  ]
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

resource "aws_security_group_rule" "core_egress_squidnat_smtp" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "587"
  to_port                  = "587"
  security_group_id        = "${aws_security_group.core.id}"
  cidr_blocks		   = ["0.0.0.0/0"]
}

#Allow access for prometheus
resource "aws_security_group_rule" "core_ingress_prometheus" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "9100"
  to_port                  = "9200"
  security_group_id        = "${aws_security_group.core.id}"
  source_security_group_id = "${module.prometheus.security_group_id}"
}
