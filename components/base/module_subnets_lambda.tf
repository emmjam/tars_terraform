# TARS Lambda subnets
module "tars_lambda_subnets" {
  source      = "../../modules/subnets"
  name        = "tars_lambda"
  project     = var.project
  environment = var.environment
  component   = var.component
  vpc_id      = aws_vpc.vpc.id

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.tars_lambda_subnets_cidrs

  route_tables = aws_route_table.private_nat.*.id
}
