# ALB for TARS bobj
resource "aws_alb" "tars-alb-bobj-private" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    "bobj"
  )}"

  internal = true

  security_groups = [
    "${aws_security_group.bobj-alb.id}",
  ]

  subnets = [
    "${module.bobj.subnet_ids}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/bobj-private"
    )
  )}"
}
