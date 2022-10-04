resource "aws_lb" "jenkins_nlb" {
  xname        = "${var.module}-b"
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id               = var.vpc_id
  availability_zones   = slice(var.availability_zones, 0, length(var.availability_zones))
  subnets_cidrs        = var.jenkins_blue_subnet_cidrs
  subnets_route_tables = var.private_route_table_ids


  name                             = "${var.project}-${var.environment}-${var.component}-${var.xname}-nlb"
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

