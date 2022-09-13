# Jenkins #############################################################

resource "aws_security_group_rule" "jenkins_ingress_alb_8080" {
  description              = "Allow TCP/8080 from ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.jenkins.id
  source_security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "jenkins_ingress_alb_49187" {
  description              = "Allow TCP/49187 from ALB"
  type                     = "ingress"
  from_port                = 49187
  to_port                  = 49187
  protocol                 = "tcp"
  security_group_id        = aws_security_group.jenkins.id
  source_security_group_id = aws_security_group.alb.id
}


# ELB #################################################################

resource "aws_security_group" "alb" {
  name        = "${var.project}-${var.environment}-${var.component}-${var.name}-alb"
  description = "SG for ${var.project}-${var.environment}-${var.component}-${var.name}-alb"
  vpc_id      = var.vpc_id

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s-%s",
        var.project,
        var.environment,
        var.component,
        var.name,
        "alb",
      )
      "Module" = var.module
    },
  )
}

resource "aws_security_group_rule" "alb_egress_jenkins_8080" {
  description              = "Allow TCP/8080 to Jenkins"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.jenkins.id
}

resource "aws_security_group_rule" "alb_egress_jenkins_49187" {
  description              = "Allow TCP/49187 to Jenkins"
  type                     = "egress"
  from_port                = 49187
  to_port                  = 49187
  protocol                 = "tcp"
  security_group_id        = aws_security_group.alb.id
  source_security_group_id = aws_security_group.jenkins.id
}