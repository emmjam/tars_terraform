# Subnets for the RDS/DMS DB's
module "subnets_rds" {
  source = "../../modules/subnets"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  name        = "test-rds"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  cidrs = [
    "${var.test_database_subnets_cidrs}",
  ]

  route_tables = [
    ["${data.terraform_remote_state.base.private_nonat_route_table_id}"]
  ]

  vpc_id = "${data.terraform_remote_state.base.vpc_id}"

  # Apply default tags, and merge with additional tags
  default_tags = "${merge(
    var.default_tags,
    map(
      "Component", var.component
    )
  )}"
}
