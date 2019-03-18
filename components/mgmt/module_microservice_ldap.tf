module "microservice_ldap" {
  source = "../../modules/microservice"

  region      = "${var.aws_region}"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  name = "ldap"

  asg_default_tags = [
    "${local.asg_default_tags}",
  ]

  asg_load_balancers = [
    "${aws_elb.ldap.name}"
  ]

  asg_size_desired_on_create = "${lookup(var.ldap_config, "asg_desired")}"
  asg_size_max               = "${lookup(var.ldap_config, "asg_max")}"
  asg_size_min               = "${lookup(var.ldap_config, "asg_min")}"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  lc_ami_id        = "${data.aws_ami.ldap.image_id}"
  lc_instance_type = "${lookup(var.ldap_config, "instance_type")}"
  lc_user_data     = "${data.template_cloudinit_config.ldap.rendered}"

  subnets_cidrs = [
    "${var.ldap_subnets_cidrs}",
  ]

  subnets_route_tables = [
    "${aws_route_table.private_nat.*.id}",
  ]

  vpc_id = "${aws_vpc.mgmt.id}"

  default_tags = "${merge(
    local.default_tags,
  )}"
}
