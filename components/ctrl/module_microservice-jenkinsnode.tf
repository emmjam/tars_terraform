module "jenkinsnode" {
  source = "../../modules/microservice"

  name        = "jenkinsnode"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id               = "${aws_vpc.ctrl.id}"
  availability_zones   = "${data.aws_availability_zones.available.names}"
  subnets_cidrs        = "${var.ctrl_jenkinsnode_subnets_cidrs}"
  subnets_route_tables = ["${aws_route_table.private_nat.*.id}"]

  lc_ami_id        = "${data.aws_ami.jenkinsnode.image_id}"
  lc_instance_type = "${lookup(var.ctrl_jenkinsnode,"instance_type")}"
  lc_user_data     = "${data.template_cloudinit_config.jenkinsnode.rendered}"

  asg_size_min               = "${lookup(var.ctrl_jenkinsnode,"asg_min_size")}"
  asg_size_desired_on_create = "${lookup(var.ctrl_jenkinsnode,"asg_min_size")}"
  asg_size_max               = "${lookup(var.ctrl_jenkinsnode,"asg_max_size")}"

  default_tags = "${var.default_tags}"
}
