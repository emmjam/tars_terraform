# CPC FRONT Internal ALB
resource "aws_alb" "cpc-front-internal" {
  name     = "${local.csi}-internal"
  internal = true
  idle_timeout = 300

  security_groups = [
    "${aws_security_group.cpc-front-internal-alb.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_cpc_alb_internal}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/internal"
    )
  )}"
}
