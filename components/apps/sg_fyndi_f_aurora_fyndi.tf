resource "aws_security_group" "fyndi-f_aurora" {
  name        = "${local.csi}/fyndi-f-db"
  description = "${local.csi}/fyndi-f-db"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/fyndi-f-db"
    },
  )
}

