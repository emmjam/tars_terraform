resource "aws_security_group_rule" "apache-ingress-apache-alb-public" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  security_group_id        = module.apache.security_group_id
  source_security_group_id = aws_security_group.apache_alb_public.id
}

resource "aws_security_group_rule" "apache-ingress-apps-alb-public" {
  count                    = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  security_group_id        = module.apache.security_group_id
  source_security_group_id = data.terraform_remote_state.apps.outputs.ibs_back_alb_sg_id
}

resource "aws_security_group_rule" "apache-egress-tars-alb-internal" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  security_group_id        = module.apache.security_group_id
  source_security_group_id = aws_security_group.tars-alb-internal.id
}

