# OBS ALB
resource "aws_alb" "obs" {
  name         = "${local.csi}-obs"
  internal     = true
  idle_timeout = 300

  access_logs {
    bucket  = module.access_logs_bucket.id
    prefix  = "public"
    enabled = true
  }

  security_groups = [
    aws_security_group.obs-alb.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_obs_alb_internal

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-obs"
    },
  )
}

