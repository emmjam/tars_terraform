resource "aws_security_group_rule" "obs_alb_jmeter_egress_jenkinsnode_1099_1101" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = aws_security_group.private-alb.id
  source_security_group_id = module.obs.security_group_id
}


