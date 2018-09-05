module "bastion" {
  source = "../../modules/microservice"

  name        = "bastion"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id             = "${aws_vpc.ctrl.id}"
  availability_zones = "${data.aws_availability_zones.available.names}"

  subnets_cidrs        = "${var.ctrl_bastion_subnets}"
  subnets_route_tables = ["${aws_route_table.private.*.id}"]

  lc_ami_id            = "${data.aws_ami.bastion.image_id}"
  lc_instance_type     = "${var.bastion_instance_type}"
  lc_user_data         = "${data.template_cloudinit_config.bastion.rendered}"
  lc_additional_sg_ids = ["${aws_security_group.bastion.id}"]

  asg_size_min               = "${var.bastion_asg_min_size}"
  asg_size_desired_on_create = "${var.bastion_asg_min_size}"
  asg_size_max               = "${var.bastion_asg_max_size}"
  asg_load_balancers         = ["${aws_elb.bastion.id}"]

  default_tags      = "${var.default_tags}"
  asg_default_tags  = [
    "${var.asg_default_tags}",
  ]
}
