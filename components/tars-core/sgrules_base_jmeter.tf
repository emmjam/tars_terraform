resource "aws_security_group_rule" "tars_alb_private_egress_whitelist_port_443" {
  description              = "Allow TCP/443 from Internet"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.jmeter_sg_id}"
  source_security_group_id = "${aws_security_group.tars-alb-private.id}"
}
