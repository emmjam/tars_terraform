# ALB for the tars core backend API access from MES
resource "aws_alb" "tars-alb-backend-api" {
  name         = "${local.csi}-api"
  internal     = "true"
  idle_timeout = 300

  access_logs {
    bucket  = module.access_logs_bucket.id
    prefix  = "private-api"
    enabled = true
  }

  security_groups = [
    aws_security_group.tars-alb-backend-api.id,
  ]

  subnets = data.terraform_remote_state.base.outputs.subnets_tars_backend_api_alb

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/backend-api"
    },
  )
}

