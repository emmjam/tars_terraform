# Define some publci facing ALB subnets
module "vpc_endpoint_subnets" {
  source      = "../../modules/subnets"
  name        = "vpc-endpoint"
  project     = var.project
  environment = var.environment
  component   = var.component
  vpc_id      = aws_vpc.vpc.id

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.vpc_endpoint_subnets_cidrs

  route_tables = list(aws_route_table.public.id)
}
