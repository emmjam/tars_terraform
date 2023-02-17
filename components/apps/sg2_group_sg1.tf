resource "aws_security_group_rule" "sg2_egress_rule" {
  type        = "egress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  security_group_id = aws_security_group.sg2.id
  source_security_group_id = aws_security_group.sg1.id

}

resource "aws_security_group_rule" "sg1_ingress_rule" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  security_group_id = aws_security_group.sg1.id
  source_security_group_id =aws_security_group.sg2.id

}

