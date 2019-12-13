# TARS backend/MES ALB tier subnets
module "tars_backend_api_alb_subnets" {
  source      = "../../modules/subnets"
  name        = "tars_backend_api_alb"
  project     = var.project
  environment = var.environment
  component   = var.component
  vpc_id      = aws_vpc.vpc.id

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.tars_backend_api_alb_subnets_cidrs

  # Check this - what does MES need? Public for testing only
  route_tables = list(aws_route_table.private_nonat.id)
}

