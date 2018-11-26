# ALB for TARS bobj
resource "aws_alb" "tars-alb-bobj-private" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    "bobj"
  )}"

  internal = false

  security_groups = [
    "${aws_security_group.bobj-alb.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_alb_public}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/bobj-private"
    )
  )}"
}
