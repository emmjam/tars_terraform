module "bastion_elb_subnets" {
  source      = "../../modules/subnets"
  name        = "bastion-elb"
  project     = var.project
  environment = var.environment
  component   = var.component
  vpc_id      = aws_vpc.ctrl.id

  availability_zones = data.aws_availability_zones.available.names

  cidrs = var.bastion_elb_subnets_cidrs

  route_tables = tolist([aws_route_table.public.id])

  default_tags = local.default_tags
}

