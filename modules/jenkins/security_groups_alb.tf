# Jenkins #############################################################

resource "aws_security_group_rule" "jenkins_ingress_nlb_8080" {
  description              = "Allow TCP/8080 from NLB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.jenkins.id
  source_security_group_id = aws_security_group.nlb.id
}

resource "aws_security_group_rule" "jenkins_ingress_nlb_49187" {
  description              = "Allow TCP/49187 from NLB"
  type                     = "ingress"
  from_port                = 49187
  to_port                  = 49187
  protocol                 = "tcp"
  security_group_id        = aws_security_group.jenkins.id
  source_security_group_id = aws_security_group.nlb.id
}


# ELB #################################################################

resource "aws_security_group" "nlb" {
  name        = "${var.project}-${var.environment}-${var.component}-${var.name}-nlb"
  description = "SG for ${var.project}-${var.environment}-${var.component}-${var.name}-nlb"
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
        "nlb",
      )
      "Module" = var.module
    },
  )
}

resource "aws_security_group_rule" "nlb_egress_jenkins_8080" {
  description              = "Allow TCP/8080 to Jenkins"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.nlb.id
  source_security_group_id = aws_security_group.jenkins.id
}

resource "aws_security_group_rule" "nlb_egress_jenkins_49187" {
  description              = "Allow TCP/49187 to Jenkins"
  type                     = "egress"
  from_port                = 49187
  to_port                  = 49187
  protocol                 = "tcp"
  security_group_id        = aws_security_group.nlb.id
  source_security_group_id = aws_security_group.jenkins.id
}