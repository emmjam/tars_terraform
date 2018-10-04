resource "aws_security_group" "cpc-front-internet-alb" {
  name        = "${local.csi}/internet-alb"
  description = "${local.csi}/internet-alb"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/internet-alb"
    )
  )}"
}
