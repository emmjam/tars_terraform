# ALB for the tars core backend API access from MES
resource "aws_alb" "tars-alb-backend-api" {
  name     = "${local.csi}-backend-api"
  internal = "true"
  idle_timeout = 300

  access_logs {
    bucket  = "${module.access_logs_bucket.id}"
    prefix  = "private-api"
    enabled = true
  }

  security_groups = [
    "${aws_security_group.tars-alb-backend-api.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_tars_backend_api_alb}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/backend-api"
    )
  )}"
}
