# CPC FRONT DVSA ALB 
resource "aws_alb" "cpc-front-dvsa" {
  name     = "${local.csi}-dvsa"
  internal = true

  security_groups = [
    "${aws_security_group.cpc-front-dvsa-alb.id}",
  ]

  subnets = [
    "${module.cpc-front.subnet_ids}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/dvsa"
    )
  )}"
}
