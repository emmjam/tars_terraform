module "microservice_jmeter" {
  source = "../../modules/microservice"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  name = "jmeter"

  asg_default_tags = [
    "${var.asg_default_tags}",
  ]

  default_tags = "${var.default_tags}"

  asg_size_desired_on_create = "${var.jmeter_asg_size_desired_on_create}"
  asg_size_max               = "${var.jmeter_asg_size_max}"
  asg_size_min               = "${var.jmeter_asg_size_min}"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  lc_additional_sg_ids = [
    "${aws_security_group.core.id}",
  ]

  lc_ami_id        = "${data.aws_ami.jmeter.image_id}"
  lc_instance_type = "${var.jmeter_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.jmeter.rendered}"

  subnets_cidrs = [
    "${var.jmeter_subnets_cidrs}",
  ]

  subnets_map_public_ip_on_launch = "false"

  subnets_route_tables = [
    "${aws_route_table.private_nat.*.id}",
  ]

  vpc_id = "${aws_vpc.vpc.id}"
}
