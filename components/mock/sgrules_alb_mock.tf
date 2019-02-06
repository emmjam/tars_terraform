# TARS Private ALB mock rules
resource "aws_security_group_rule" "tars_alb_mock_ingress_tars_backend_port_8080" {
  description              = "Allow TCP/8080 from tars core backend"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-mock.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-backend-sg-id}"
}

resource "aws_security_group_rule" "tars_alb_mock_ingress_obs_port_8080" {
  description              = "Allow TCP/8080 from OBS"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-mock.id}"
  source_security_group_id = "${data.terraform_remote_state.obs.obs-sg-id}"
}

resource "aws_security_group_rule" "tars_alb_mock_egress_tars_mock_port_8080" {
  description              = "Allow TCP/8080 to tars core mock"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-mock.id}"
  source_security_group_id = "${aws_security_group.tars-mock.id}"
}

resource "aws_security_group_rule" "tars_alb_mock_ingress_cpc_back_port_8080" {
  description              = "Allow TCP/8080 from CPC Back"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-mock.id}"
  source_security_group_id = "${data.terraform_remote_state.cpc.cpc-back-sg-id}"
}

resource "aws_security_group_rule" "tars_alb_mock_ingress_cpc_batch_port_8080" {
  description              = "Allow TCP/8080 from CPC Batch"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-mock.id}"
  source_security_group_id = "${data.terraform_remote_state.cpc-batch.cpc-batch-sg-id}"
}

resource "aws_security_group_rule" "tars_alb_mock_ingress_tars_frontend_port_8080" {
  description              = "Allow TCP/8080 from tars core frontend"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-mock.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-frontend-sg-id}"
}

resource "aws_security_group_rule" "tars_alb_mock_ingress_tars_batch_port_8080" {
  description              = "Allow TCP/8080 from tars batch"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-mock.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-batch.tars-batch-sg-id}"
}
