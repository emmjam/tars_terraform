resource "aws_security_group" "core" {
  name        = "${local.csi}-core"
  description = "Core SG"
  vpc_id      = aws_vpc.ctrl.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/core"
    },
  )
}

