# Define some publc facing ALB subnets
module "lb_subnets" {
  source      = "../../modules/subnets"
  name        = "lb-xenco"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  vpc_id      = "${data.terraform_remote_state.base.vpc_id}"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  cidrs = [
    "${var.xenco_lb_subnets_cidrs}",
  ]

  route_tables = [
    "${data.terraform_remote_state.base.private_nat_route_table_id}",
  ]
}
