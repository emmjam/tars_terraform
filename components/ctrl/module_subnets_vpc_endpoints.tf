module "vpc_endpoints_subnets" {
  source      = "../../modules/subnets"
  name        = "vpc-endpoints"
  project     = var.project
  environment = var.environment
  component   = var.component
  vpc_id      = aws_vpc.ctrl.id

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.vpc_endpoint_subnets_cidrs

  route_tables = list(aws_route_table.private.id)

  default_tags = local.default_tags
}

