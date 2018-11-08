resource "aws_security_group_rule" "tars_core_apache_egress_obs_alb" {
  description              = "Allow TCP/80 to OBS Internal ALB"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-apache-sg-id}"
  source_security_group_id = "${aws_security_group.obs-alb.id}"
}
