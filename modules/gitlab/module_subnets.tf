module "elb_subnets" {
  source = "../../modules/subnets"

  name        = "${var.name}-elb"
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id             = var.vpc_id
  availability_zones = data.aws_availability_zones.available.names
  cidrs              = var.elb_subnets_cidrs
  route_tables       = var.elb_public_route_table_ids
}

module "elb_private_subnets" {
  source = "../../modules/subnets"

  name        = "${var.name}-elb-private"
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id             = var.vpc_id
  availability_zones = data.aws_availability_zones.available.names
  cidrs              = var.elb_private_subnets_cidrs
  route_tables       = var.elb_private_route_table_ids
}

module "db_subnets" {
  source = "../../modules/subnets"

  name        = "${var.module}-db"
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id             = var.vpc_id
  availability_zones = data.aws_availability_zones.available.names
  cidrs              = var.db_subnets_cidrs
  route_tables       = var.db_private_route_table_ids
}

module "redis_subnets" {
  source = "../../modules/subnets"

  name        = "${var.module}-redis"
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id             = var.vpc_id
  availability_zones = data.aws_availability_zones.available.names
  cidrs              = var.redis_subnets_cidrs
  route_tables       = var.redis_private_route_table_ids
}

