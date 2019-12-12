resource "aws_security_group" "fyndi-b_aurora" {
  name        = "${local.csi}/fyndi-b-db"
  description = "${local.csi}/fyndi-b-db"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/fyndi-b-db"
    },
  )
}

