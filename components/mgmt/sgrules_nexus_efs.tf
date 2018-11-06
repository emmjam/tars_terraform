# Rule to permit access to EFS Mount Targets from nexus
resource "aws_security_group_rule" "nexus_efs_ingress_nexus" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.nexus_efs.id}"
  source_security_group_id = "${module.microservice_nexus.security_group_id}"
}
