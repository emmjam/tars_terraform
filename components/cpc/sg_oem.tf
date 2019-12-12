resource "aws_security_group" "cpc-oem" {
  name        = "${local.csi}/oem"
  description = "${local.csi}/oem"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/oem"
    },
  )
}

