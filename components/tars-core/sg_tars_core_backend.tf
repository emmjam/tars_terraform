# SGs for the tars core servers
resource "aws_security_group" "tars-core-backend" {
  name        = "${local.csi}-tars-core-backend"
  description = "TARS Core Backend"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/tars-core-backend"
    )
  )}"
}
