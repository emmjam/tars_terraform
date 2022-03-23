# ALB for public facing tars
resource "aws_alb" "tars-private-facing" {
  name         = "${local.csi}-private"
  internal     = "true"
  idle_timeout = 300

  access_logs {
    bucket  = module.access_logs_bucket.id
    prefix  = "private-frontend"
    enabled = true
  }

  security_groups = [
    aws_security_group.tars-alb-private.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_tars_web

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/private"
    },
  )
}

