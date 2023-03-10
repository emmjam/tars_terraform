# SG for the tars messaging ALB
resource "aws_security_group" "tars-alb-messaging" {
  name        = "${local.csi}-tars-alb-messaging"
  description = "TARS ALB Messaging"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/tars-alb-messaging"
    },
  )
}

