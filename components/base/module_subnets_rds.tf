# Subnets for the RDS DB's
module "subnets_rds" {
  source = "../../modules/subnets"

  project     = var.project
  environment = var.environment
  component   = var.component
  name        = "rds"

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.rds_subnets_cidrs

  route_tables = tolist([aws_route_table.private_nonat.id])

  vpc_id       = aws_vpc.vpc.id
  default_tags = local.default_tags
}

