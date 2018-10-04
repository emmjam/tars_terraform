resource "aws_security_group" "cpc-front-dva-alb" {
  name        = "${local.csi}/dva-alb"
  description = "${local.csi}/dva-alb"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/dva-alb"
    )
  )}"
}
