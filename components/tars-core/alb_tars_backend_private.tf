# ALB for the tars core backend
resource "aws_alb" "tars-alb-backend-private" {
  name         = "${local.csi}-backend"
  internal     = true
  idle_timeout = 300

  access_logs {
    bucket  = module.access_logs_bucket.id
    prefix  = "private-backend"
    enabled = true
  }

  security_groups = [
    aws_security_group.tars-alb-backend.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_tars_backend_elb

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/backend-private"
    },
  )
}

