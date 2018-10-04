# CPC FRONT DVSA ALB 
resource "aws_alb" "cpc-front-dvsa-internet" {
  name     = "${local.csi}-dvsa-internet"
  internal = false

  security_groups = [
    "${aws_security_group.cpc-front-dvsa-internet-alb.id}",
  ]

  subnets = [
    "${data.terraform_remote_state.base.subnets_alb_public}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/dvsa-internet"
    )
  )}"
}
