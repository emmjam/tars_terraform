resource "aws_alb" "private" {
  name         = "${local.csi}-private"
  internal     = true
  idle_timeout = 300

  access_logs {
    bucket  = module.access_logs_bucket.id
    prefix  = "private"
    enabled = true
  }

  security_groups = [
    aws_security_group.private-alb.id,
  ]

  # TODO: Move this to a better named subnet
  subnets = data.terraform_remote_state.base.outputs.subnets_fyndi_back_alb

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-private"
    },
  )
}


