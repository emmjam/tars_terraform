resource "aws_security_group" "cpc-front-internal-alb" {
  name        = "${local.csi}/internal-alb"
  description = "${local.csi}/internal-alb"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/internal-alb"
    )
  )}"
}
