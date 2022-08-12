# TARS public facing alb rules
resource "aws_security_group_rule" "tars_alb_drv_ingress_443" {
  count = var.drv_svc_enabled ? 1 : 0

  description              = "Allow TCP/443 from Internet"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.tars_alb_drv_svc[0].id
}

resource "aws_security_group_rule" "tars_alb_drv_ingress_80" {
  count = var.drv_svc_enabled ? 1 : 0

  description              = "Allow TCP/8443 to tars core frontend"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.tars_alb_drv_svc[0].id
}

resource "aws_security_group_rule" "tars_alb_drv_egress_443" {
  count = var.drv_svc_enabled ? 1 : 0

  description              = "Allow TCP/443 to tars core frontend LB"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.tars_alb_drv_svc[0].id
}

resource "aws_security_group_rule" "tars_alb_drv_egress_80" {
  count = var.drv_svc_enabled ? 1 : 0
  
  description              = "Allow TCP/443 to tars core frontend LB"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]
  security_group_id        = aws_security_group.tars_alb_drv_svc[0].id
}
