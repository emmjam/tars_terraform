resource "aws_security_group" "ibs-alb" {
  name        = "${local.csi}/ibs-alb"
  description = "${local.csi}/ibs-alb"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/ibs-alb"
    )
  )}"
}
