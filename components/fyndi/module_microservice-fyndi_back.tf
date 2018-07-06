module "fyndi-b" {
  source = "../../modules/microservice"

  name        = "fyndi-back"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id             = "${data.terraform_remote_state.base.vpc_id}"
  availability_zones = "${data.aws_availability_zones.available.names}"

  subnets_cidrs                   = "${var.fyndi-b_subnets_cidrs}"
  subnets_route_tables            = ["${data.terraform_remote_state.base.private_nonat_route_table_id}"]

  lc_ami_id        = "${data.aws_ami.fyndi-b.image_id}"
  lc_instance_type = "${var.fyndi-b_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.fyndi-b.rendered}"

  lc_additional_sg_ids = [
    "${aws_security_group.fyndi-b.id}",
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  asg_size_min               = "${var.fyndi-b_asg_min_size}"
  asg_size_desired_on_create = "${var.fyndi-b_asg_min_size}"
  asg_size_max               = "${var.fyndi-b_asg_max_size}"
  asg_load_balancers         = []

  default_tags = "${var.default_tags}"
}
