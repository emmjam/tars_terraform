resource "aws_security_group" "bobj" {
  name        = "${local.csi}/bobj"
  description = "${local.csi}/bobj"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/bobj"
    )
  )}"
}
