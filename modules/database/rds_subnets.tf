module "rds_subnets" {
  source = "../../modules/subnets"

  name        = var.module
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id             = var.vpc_id
  availability_zones = [var.availability_zones]
  cidrs              = [var.subnets_cidrs]
  route_tables       = [var.subnets_route_tables]
}

resource "aws_db_subnet_group" "main" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
  )

  description = "DB Subnet Group"
  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  subnet_ids = [module.rds_subnets.subnet_ids]

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "rds-subnet-grp",
      )
      "Module" = var.module
    },
  )
}

