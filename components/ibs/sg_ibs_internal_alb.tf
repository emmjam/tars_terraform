resource "aws_security_group" "ibs_internal-alb" {
  name        = "${local.csi}/ibs_internal-alb"
  description = "${local.csi}/ibs_internal-alb"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/ibs_internal-alb"
    )
  )}"
}
