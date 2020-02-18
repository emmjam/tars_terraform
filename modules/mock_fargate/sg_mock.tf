resource "aws_security_group" "mock" {
  name        = "${local.csi}/mock"
  description = "${local.csi}/mock"
  vpc_id      = var.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/mock"
    },
  )
}

