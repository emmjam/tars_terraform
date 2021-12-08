# NAT subnets
module "elc_subnets" {
  source      = "../../modules/subnets"
  name        = "elc-main"
  project     = var.project
  environment = var.environment
  component   = var.component
  vpc_id      = aws_vpc.vpc.id

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.elc_main_subnets_cidrs

  route_tables = tolist([aws_route_table.private_nonat.id])
}

