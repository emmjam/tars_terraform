# ALB for TARS messaging
resource "aws_alb" "tars-alb-messaging-private" {
  name = format("%s-%s-%s-%s", var.project, var.environment, "tars", "msg")

  internal = true

  security_groups = [
    aws_security_group.tars-alb-messaging.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_tars_messaging_alb

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/messaging-private"
    },
  )
}

