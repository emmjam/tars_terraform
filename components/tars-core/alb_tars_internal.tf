resource "aws_alb" "tars-internal" {
  name         = "${local.csi}-internal"
  internal     = true
  idle_timeout = 300

  security_groups = [
    aws_security_group.tars-alb-internal.id,
  ]

  access_logs {
    bucket  = module.access_logs_bucket.id
    prefix  = "internal-frontend"
    enabled = true
  }

  subnets = data.terraform_remote_state.base.outputs.subnets_tars_alb_internal

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/internal"
    },
  )
}

