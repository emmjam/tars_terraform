resource "aws_security_group_rule" "kms_endpoint_ingress_tars_core_frontend" {
  description              = "Allow use of KMS endpoint"
  type                     = "ingress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = "${data.terraform_remote_state.base.kms_sg_id}"
  source_security_group_id = "${aws_security_group.tars-core-frontend.id}"
}
