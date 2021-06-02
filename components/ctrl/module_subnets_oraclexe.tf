module "oraclexe_subnets" {
  source      = "../../modules/subnets"
  name        = "oraclexe"
  project     = var.project
  environment = var.environment
  component   = var.component
  vpc_id      = aws_vpc.ctrl.id

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.oraclexe_subnets_cidrs

  route_tables = aws_route_table.private.*.id

  default_tags = local.default_tags
}

