resource "aws_security_group_rule" "private-alb_ingress_public" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = aws_security_group.private-alb.id

  cidr_blocks = var.whitelist
}

resource "aws_security_group_rule" "private-jmeter_egress_jenkinsnode_1099_1101" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = aws_security_group.private-alb.id
  source_security_group_id = module.fyndi-b.security_group_id
}

resource "aws_security_group_rule" "private-alb_ingress_tars_batch" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = aws_security_group.private-alb.id
  source_security_group_id = data.terraform_remote_state.tars-batch.outputs.tars-batch-sg-id
}

