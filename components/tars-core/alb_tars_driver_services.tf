resource "aws_alb" "tars_alb_drv_svc" {
  count            = var.drv_svc_enabled == true ? 1 : 0

  name = format("%s-%s", local.csi, "drv-svc")

  internal     = "false"
  idle_timeout = 300

  security_groups = [
    aws_security_group.tars_alb_drv_svc.id[0],
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_alb_public

  tags = merge(
    local.default_tags,
    {
      "Name" = format("%s/%s", local.csi, "tars-drv-svc")
    },
  )
}

