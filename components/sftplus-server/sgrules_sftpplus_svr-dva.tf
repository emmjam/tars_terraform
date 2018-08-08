
resource "aws_security_group_rule" "sftpplus-alb_ingress_public" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "543"
  to_port                  = "543"
  security_group_id        = "${aws_security_group.sftpplus_svr-dva-lb.id}"
  cidr_blocks              = ["${var.dva_whitelist}"]
}

resource "aws_security_group_rule" "sftpplus-svr_egress_543" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "543"
  to_port                  = "543"
  security_group_id        = "${aws_security_group.sftpplus_svr-dva-lb.id}"
  cidr_blocks              = ["${var.dva_whitelist}"]
}