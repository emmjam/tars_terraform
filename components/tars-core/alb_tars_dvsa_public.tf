# ALB for public facing tars
resource "aws_alb" "tars-dvsa-public" {
  name         = "${local.csi}-dvsa-public"
  internal     = "false"
  idle_timeout = 300

  security_groups = [
    aws_security_group.tars-dvsa-public.id,
  ]

  access_logs {
    bucket  = module.access_logs_bucket.id
    prefix  = "tars-dvsa-public"
    enabled = true
  }

  subnets = data.terraform_remote_state.base.outputs.subnets_tars_dvsa_public

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/public"
    },
  )
}

