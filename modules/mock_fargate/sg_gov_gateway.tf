resource "aws_security_group" "gov_gateway" {
  name        = "${local.csi}/mock-gov_gateway"
  description = "${local.csi}/mock-gov_gateway"
  vpc_id      = var.vpc_id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/mock-gov_gateway"
    },
  )
}

