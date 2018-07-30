resource "aws_security_group_rule" "sftpplus-ingress-sftpplus-alb-15021" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "15021"
  to_port                  = "15021"
  security_group_id        = "${aws_security_group.sftpplus_svr-cpc-lb.id}"
  source_security_group_id = "${data.terraform_remote_state.cpc.cpc-back-alb}"
}

resource "aws_security_group_rule" "sftpplus-egress-tars-back-8080" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "15021"
  to_port                  = "15021"
  security_group_id        = "${aws_security_group.sftpplus_svr-cpc-lb.id}"
  source_security_group_id = "${data.terraform_remote_state.cpc.cpc-back-alb}"
}

