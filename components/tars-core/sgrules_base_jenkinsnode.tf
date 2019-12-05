# jenkinsnode to rds DB
resource "aws_security_group_rule" "jenkinsnode_egress_oracle_db" {
  description              = "Allow TCP/1521 to RDS"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
  source_security_group_id = "${aws_security_group.tars-core-db.id}"
}

resource "aws_security_group_rule" "tars_alb_api_egress_Jenkins_port_8443" {
  description              = "Allow TCP/8443 to API from Jenkins"
  type                     = "egress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
  source_security_group_id = "${aws_security_group.tars-alb-backend-api.id}"
}
resource "aws_security_group_rule" "tars_alb_api_ingress_Jenkins_port_8443" {
  description              = "Allow TCP/8443 from JenkinsNode"
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-backend-api.id}"
  source_security_group_id = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
}

