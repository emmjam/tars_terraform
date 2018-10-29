# SG for TARS mock server
resource "aws_security_group" "tars-mock" {
  name        = "${local.csi}-tars-mock"
  description = "TARS mock"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-tars-mock"
    )
  )}"
}
