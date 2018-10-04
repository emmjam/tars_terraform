resource "aws_security_group" "cpc-front-dvsa-internet-alb" {
  name        = "${local.csi}/dvsa-internet-alb"
  description = "${local.csi}/dvsa-internet-alb"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/dvsa-internet-alb"
    )
  )}"
}
