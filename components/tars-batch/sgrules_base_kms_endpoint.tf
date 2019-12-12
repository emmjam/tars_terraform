# SG rules for the KMS endpoint
# Allow the tars batch to use the KMS endpoint
#
# TODO: peacheym: Too wide. Restrict to TCP/443
resource "aws_security_group_rule" "kms_endpoint_ingress_tars_batch" {
  description              = "Allow use of KMS endpoint"
  type                     = "ingress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = data.terraform_remote_state.base.outputs.kms_sg_id
  source_security_group_id = module.tars_batch.security_group_id
}

