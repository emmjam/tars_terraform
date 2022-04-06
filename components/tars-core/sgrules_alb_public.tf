resource "aws_security_group_rule" "alb-public-ingress-whitelist" {
  description       = "Allow TCP/443 from public whitelist"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  security_group_id = aws_security_group.tars_core_alb_public.id
  cidr_blocks = var.whitelist
}

resource "aws_security_group_rule" "alb-public-egress-internal-alb" {
  description              = "Allow TCP/443 from public LB to tars core internal LB"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 443
  to_port                  = 443
  security_group_id        = aws_security_group.tars_core_alb_public.id
  source_security_group_id = aws_security_group.tars-alb-internal.id
}

resource "aws_security_group_rule" "alb-public-egress-internal-irdt-ec2" {
  description              = "Allow TCP/7443 from public LB to irdt EC2"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 7443
  to_port                  = 7443
  security_group_id        = aws_security_group.tars_core_alb_public.id
  source_security_group_id = module.tars_front.security_group_id
}

resource "aws_security_group_rule" "alb-public-egress-internal-obs-ec2" {
  description              = "Allow TCP/8080 from public LB to obs EC2"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 8080
  to_port                  = 8080
  security_group_id        = aws_security_group.tars_core_alb_public.id
  source_security_group_id = data.terraform_remote_state.apps.outputs.obs-sg-id
}

resource "aws_security_group_rule" "alb-public-egress-internal-cpc-ec2" {
  description              = "Allow TCP/9443 from public LB to obs EC2"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 9443
  to_port                  = 9443
  security_group_id        = aws_security_group.tars_core_alb_public.id
  source_security_group_id = data.terraform_remote_state.cpc.outputs.cpc-front-sg-id
}