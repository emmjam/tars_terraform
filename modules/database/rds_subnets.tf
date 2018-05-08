module "rds_subnets" {
  source = "../../modules/subnets"

  name        = "${var.module}"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id             = "${var.vpc_id}"
  availability_zones = ["${var.availability_zones}"]
  cidrs              = ["${var.subnets_cidrs}"]
  route_tables       = ["${var.subnets_route_tables}"]
}

resource "aws_db_subnet_group" "main" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name
  )}"

  description = "DB Subnet Group"
  subnet_ids  = ["${module.rds_subnets.subnet_ids}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "rds-subnet-grp"
      ),
      "Module", var.module
    )
  )}"
}
