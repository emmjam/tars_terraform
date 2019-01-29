# A subnet tuple for nexus EFS
module "subnets_nexus_efs" {
  source = "../../modules/subnets"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  name        = "nexus-efs"
 
  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]
 
  cidrs = [
    "${var.nexus_efs_subnets_cidrs}",
  ]
 
  route_tables = [
    "${aws_route_table.private.id}",
  ]
 
  vpc_id = "${aws_vpc.mgmt.id}"

  default_tags = "${local.default_tags}"
}
