# CPC FRONT Internet ALB
resource "aws_alb" "cpc-front-internet" {
  name     = "${local.csi}-internet"
  internal = false
  idle_timeout = 300

  security_groups = [
    "${aws_security_group.cpc-front-internet-alb.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_alb_public}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/internet"
    )
  )}"
}
