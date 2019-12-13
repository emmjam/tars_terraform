# TARS Core ALB backend rules
resource "aws_security_group" "tars-alb-backend-api" {
  name        = "${local.csi}-tars-alb-backend-api"
  description = "TARS ALB Backend API"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/tars-alb-backend-api"
    },
  )
}

