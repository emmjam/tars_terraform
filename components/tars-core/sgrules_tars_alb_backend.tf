# TARS Private ALB backend rules
resource "aws_security_group_rule" "tars_alb_backend_ingress_tars_frontend_port_8080" {
  description              = "Allow TCP/8080 from tars core frontend"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-backend.id}"
  source_security_group_id = "${module.tars_front.security_group_id}"
}

resource "aws_security_group_rule" "tars_alb_backend_egress_tars_backend_port_8080" {
  description              = "Allow TCP/8080 to tars core backend"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-backend.id}"
  source_security_group_id = "${module.tars_back.security_group_id}"
}