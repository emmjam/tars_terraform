module "bastion" {
  source = "../../modules/microservice"

  name        = "bastion"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id             = "${aws_vpc.mgmt.id}"
  availability_zones = "${data.aws_availability_zones.available.names}"

  subnets_cidrs        = "${var.bastion_subnets_cidrs}"
  subnets_route_tables = ["${aws_route_table.private.*.id}"]

  lc_ami_id            = "${data.aws_ami.bastion.image_id}"
  lc_instance_type     = "${lookup(var.bastion,"instance_type")}"
  lc_user_data         = "${data.template_cloudinit_config.bastion.rendered}"
  lc_additional_sg_ids = ["${aws_security_group.mgmt.id}"]

  asg_size_min               = "${lookup(var.bastion,"asg_min_size")}"
  asg_size_desired_on_create = "${lookup(var.bastion,"asg_min_size")}"
  asg_size_max               = "${lookup(var.bastion,"asg_max_size")}"
  asg_load_balancers         = ["${aws_elb.bastion.id}"]

  default_tags = "${var.default_tags}"
}
