module "nlb_subnets" {
  source = "../../modules/subnets"

  name        = "${var.name}-nlb"
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id             = var.vpc_id
  availability_zones = var.availability_zones
  cidrs              = var.alb_subnets_cidrs
  route_tables       = var.private_route_table_ids
}

