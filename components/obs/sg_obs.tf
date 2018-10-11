resource "aws_security_group" "obs" {
  name        = "${local.csi}/obs"
  description = "${local.csi}/obs"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/obs"
    )
  )}"
}
