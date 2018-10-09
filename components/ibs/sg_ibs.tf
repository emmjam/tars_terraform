resource "aws_security_group" "ibs" {
  name        = "${local.csi}/ibs"
  description = "${local.csi}/ibs"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/ibs"
    )
  )}"
}
