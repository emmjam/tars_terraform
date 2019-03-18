# A subnet tuple for LDAP ELB
module "subnets_ldap_elb" {
  source = "../../modules/subnets"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  name        = "ldap-elb"
 
  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]
 
  cidrs = [
    "${var.ldap_elb_subnets_cidrs}",
  ]
 
  route_tables = [
    "${aws_route_table.private.id}",
  ]
 
  vpc_id = "${aws_vpc.mgmt.id}"

  default_tags = "${local.default_tags}"
}
