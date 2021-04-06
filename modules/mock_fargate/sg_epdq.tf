resource "aws_security_group" "epdq" {
  name        = "${local.csi}/mock-epdq"
  description = "${local.csi}/mock-epdq"
  vpc_id      = var.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/mock-epdq"
    },
  )
}

