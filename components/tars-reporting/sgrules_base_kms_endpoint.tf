# SG rules for the KMS endpoint
#
resource "aws_security_group_rule" "kms_endpoint_ingress_tars_batch" {
  description              = "Allow use of KMS endpoint"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.base.outputs.kms_sg_id
  source_security_group_id = aws_security_group.bobj.id
}

