resource "aws_security_group_rule" "ibs-ingress-tars-backend-8080" {
  description              = "Allow TCP/8080 from IBS"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
  source_security_group_id = "${module.ibs.security_group_id}"
}
