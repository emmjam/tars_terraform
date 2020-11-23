# FYNDI ALBs
resource "aws_alb" "apps" {
  name         = "${local.csi}-apps"
  internal     = false
  idle_timeout = 300

  access_logs {
    bucket  = module.access_logs_bucket.id
    prefix  = "front"
    enabled = true
  }

  security_groups = [
    aws_security_group.fyndi-f-alb.id,
    aws_security_group.ibs-alb.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_alb_public

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-apps"
    },
  )
}

