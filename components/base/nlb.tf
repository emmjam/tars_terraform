resource "aws_lb" "jenkins_nlb" {
  project     = var.project
  environment = var.environment
  component   = var.component
  private_route_table_ids = aws_route_table.private_nat.*.id
  alb_subnets_cidrs = jenkins_alb_subnets_cidrs
  xavailability_zones = data.aws_availability_zones.available.names

  vpc_id               = aws_vpc.vpc.id
  availability_zones   = slice(xavailability_zones, 0, length(xavailability_zones))
  subnets_cidrs        = jenkins_blue_subnet_cidrs
  subnets_route_tables = private_route_table_ids


  name                             = "${var.project}-${var.environment}-${var.component}-${var.name}-nlb"
  load_balancer_type               = "network"
  internal                         = var.elb_internal
  enable_cross_zone_load_balancing = var.elb_cross_zone_load_balancing
  subnets                          = module.nlb_subnets.subnet_ids

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        var.name,
      )
      "Module" = var.module
    },
  )
}

