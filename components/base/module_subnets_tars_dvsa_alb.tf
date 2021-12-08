# Subnets for the TARS
module "tars_dvsa_alb_subnets" {
  source = "../../modules/subnets"

  project     = var.project
  environment = var.environment
  component   = var.component
  name        = "tars-dvsa-alb"

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.tars_dvsa_alb_cidrs

  route_tables = tolist([aws_route_table.public.id])

  vpc_id       = aws_vpc.vpc.id
  default_tags = local.default_tags
}

