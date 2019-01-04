# A subnet tuple for batch EFS
module "subnets_cpc_batch_efs" {
  source = "../../modules/subnets"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  name        = "cpc-batch-efs"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  cidrs = [
    "${var.cpc_efs_subnets_cidrs}",
  ]

  route_tables = [
    "${data.terraform_remote_state.base.private_nat_route_table_id}",
  ]

  vpc_id = "${data.terraform_remote_state.base.vpc_id}"

  default_tags = "${local.default_tags}"
}
