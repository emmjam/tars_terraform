resource "aws_security_group" "bobj-ad" {
  name        = "${local.csi}/bobj-ad"
  description = "${local.csi}/bobj-ad"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/bobj-ad"
    )
  )}"
}
