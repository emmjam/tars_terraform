resource "aws_security_group" "obs-alb" {
  name        = "${local.csi}/obs-alb"
  description = "${local.csi}/obs-alb"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/obs-alb"
    )
  )}"
}
