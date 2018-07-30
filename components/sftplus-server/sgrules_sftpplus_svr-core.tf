resource "aws_security_group_rule" "sftpplus-ingress-sftpplus-cpc-alb-15021" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "15021"
  to_port                  = "15021"
  security_group_id        = "${aws_security_group.sftpplus_svr-core.id}"
  source_security_group_id = "${aws_security_group.sftpplus_svr-cpc-lb.id}"
}

resource "aws_security_group_rule" "sftpplus-ingress-sftpplus-dva-alb-543" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "543"
  to_port                  = "543"
  security_group_id        = "${aws_security_group.sftpplus_svr-core.id}"
  source_security_group_id = "${aws_security_group.sftpplus_svr-dva-lb.id}"
}

resource "aws_security_group_rule" "sftpplus-egress-sftpplus-cpc-alb-15021" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "15021"
  to_port                  = "15021"
  security_group_id        = "${aws_security_group.sftpplus_svr-core.id}"
  source_security_group_id = "${aws_security_group.sftpplus_svr-cpc-lb.id}"
}

resource "aws_security_group_rule" "sftpplus-egress-sftpplus-dva-alb-543" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "543"
  to_port                  = "543"
  security_group_id        = "${aws_security_group.sftpplus_svr-core.id}"
  source_security_group_id = "${aws_security_group.sftpplus_svr-dva-lb.id}"
}

