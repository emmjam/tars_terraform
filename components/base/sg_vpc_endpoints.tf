resource "aws_security_group" "vpc_endpoints" {
  name        = "${local.csi}-vpc-endpoints"
  description = "SG for VPC Endpoints"
  vpc_id      = aws_vpc.vpc.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/vpc-endpoints"
    },
  )
}

