# Public Route Table for any public subnet within the VPC
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  # Apply default tags, and merge with additional tags
  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/public"
    },
  )
}

resource "aws_route_table" "private_nat" {
  count  = length(var.squidnat_subnets_cidrs)
  vpc_id = aws_vpc.vpc.id

  # Apply default tags, and merge with additional tags
  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/private_nat"
    },
  )
}

resource "aws_route_table" "private_nonat" {
  vpc_id = aws_vpc.vpc.id

  # Apply default tags, and merge with additional tags
  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/private_nonat"
    },
  )
}

resource "aws_route_table" "private_natgw" {
  vpc_id = aws_vpc.vpc.id

  # Apply default tags, and merge with additional tags
  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/private_natgw"
    },
  )
}

