resource "aws_security_group_rule" "bobj-alb_egress_http" {
  description              = ""
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.cpc.outputs.cpc_dvsa_internet_sg_id
  source_security_group_id = aws_security_group.bobj.id
}

resource "aws_security_group_rule" "bobj_ingress_http" {
  description              = ""
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bobj.id
  source_security_group_id = data.terraform_remote_state.cpc.outputs.cpc_dvsa_internet_sg_id
}

