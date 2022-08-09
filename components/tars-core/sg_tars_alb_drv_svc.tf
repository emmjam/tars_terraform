resource "aws_security_group" "tars_alb_drv_svc" {
  count = var.drv_svc_enabled == true ? 1 : 0 

  name        = "${local.csi}-tars-alb-drv-svc"
  description = "TARS ALB Driver Services"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/tars-drv-svc"
    },
  )
}

