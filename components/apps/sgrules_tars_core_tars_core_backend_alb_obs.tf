resource "aws_security_group_rule" "obs-ingress-tars-back-8080" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
  source_security_group_id = "${module.obs.security_group_id}"
}
