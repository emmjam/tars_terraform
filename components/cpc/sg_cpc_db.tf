resource "aws_security_group" "cpc-db" {
  name        = "${local.csi}/cpc-db"
  description = "${local.csi}/cpc-db"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/cpc-db"
    },
  )
}

