resource "aws_security_group" "bobj" {
  name        = "${local.csi}/bobj"
  description = "${local.csi}/bobj"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/bobj"
    },
  )
}

