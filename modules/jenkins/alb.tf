resource "aws_alb" "jenkins" {
  name     = "${var.project}-${var.environment}-${var.component}-${var.name}"
  internal = "false"

  enable_cross_zone_load_balancing = true
  enable_http2                     = true

  security_groups = [aws_security_group.elb.id]

  subnets = module.elb_subnets.subnet_ids

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        var.name,
      )
      "Module" = var.module
    },
  )
}

resource "aws_alb_listener" "jenkins_80" {
  load_balancer_arn = aws_alb.jenkins
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.public_default.arn
  }
}

resource "aws_alb_listener" "jenkins_49187" {
  load_balancer_arn = aws_alb.jenkins
  port              = "49187"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.public_default.arn
  }
}

resource "aws_alb_target_group" "envis" {
  name        = "${local.csi}-envis"
  target_type = "lambda"
}

resource "aws_alb_target_group_attachment" "envis" {
  target_group_arn = aws_alb_target_group.envis.arn
  target_id        = module.envis.arn
  depends_on       = [aws_lambda_permission.envis]
}