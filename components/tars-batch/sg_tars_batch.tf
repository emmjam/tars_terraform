# SG for TARS batch server
resource "aws_security_group" "tars-batch" {
  name        = "${local.csi}-tars-batch"
  description = "TARS Batch"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/tars-batch"
    )
  )}"
}
