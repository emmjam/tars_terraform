# SG for TARS mock server
resource "aws_security_group" "tars-mock" {
  name        = "${local.csi}-tars-mock"
  description = "TARS mock"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-tars-mock"
    },
  )
}

