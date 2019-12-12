module "nat_subnets" {
  source      = "../../modules/subnets"
  name        = "nat"
  project     = var.project
  environment = var.environment
  component   = var.component
  vpc_id      = aws_vpc.mgmt.id

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.nat_subnets_cidr

  route_tables = aws_route_table.private_nat.*.id

  default_tags = local.default_tags
}

