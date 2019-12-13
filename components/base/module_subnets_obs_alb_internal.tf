# NAT subnets
module "obs_alb_internal" {
  source      = "../../modules/subnets"
  name        = "obs-alb-internal"
  project     = var.project
  environment = var.environment
  component   = var.component
  vpc_id      = aws_vpc.vpc.id

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.obs_alb_internal

  route_tables = list(aws_route_table.private_nonat.id)
}

