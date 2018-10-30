resource "aws_security_group" "dms-oem" {
  name        = "${local.csi}/oem"
  description = "${local.csi}/oem"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/oem"
    )
  )}"
}
