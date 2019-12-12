# TARS Core ALB backend-payments rules
resource "aws_security_group" "tars-alb-backend-payments" {
  name        = "${local.csi}-tars-alb-backend-payments"
  description = "TARS ALB Backend"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/tars-alb-backend-payments"
    },
  )
}

