# Subnets for the RDS DB's
module "subnets_mis" {
  source = "../../modules/subnets"

  project     = var.project
  environment = var.environment
  component   = var.component
  name        = "mis"

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.mis_rds_subnets_cidrs

  route_tables = list(aws_route_table.private_nonat.id)

  vpc_id       = aws_vpc.vpc.id
  default_tags = local.default_tags
}

