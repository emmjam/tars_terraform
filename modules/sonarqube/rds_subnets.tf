module "rds_subents" {
  source = "../../modules/subnets"

  name        = "${var.module}-db"
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id             = var.vpc_id
  availability_zones = var.aws_availability_zones
  cidrs              = var.rds_subnets_cidrs
  route_tables       = var.routing_table
}

resource "aws_db_subnet_group" "sonarqube" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "sonarqube",
  )

  description = "SonarQube DB"
  subnet_ids  = module.rds_subents.subnet_ids

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "sonarqube",
      )
      "Module" = var.module
    },
  )
}

