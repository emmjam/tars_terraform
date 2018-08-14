module "fyndi-f" {
  source = "../../modules/microservice"

  name        = "fyndi-front"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id             = "${data.terraform_remote_state.base.vpc_id}"
  availability_zones = "${data.aws_availability_zones.available.names}"

  subnets_cidrs                   = "${var.fyndi-f_subnets_cidrs}"
  subnets_route_tables            = ["${data.terraform_remote_state.base.private_nonat_route_table_id}"]

  lc_ami_id        = "${data.aws_ami.fyndi-f.image_id}"
  lc_instance_type = "${var.fyndi-f_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.fyndi-f.rendered}"

  asg_target_group_arns = [ "${aws_alb_target_group.fyndi-f-8080.id}" ]

  lc_additional_sg_ids = [
    "${aws_security_group.fyndi-f.id}",
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  asg_size_min               = "${var.fyndi-f_asg_min_size}"
  asg_size_desired_on_create = "${var.fyndi-f_asg_min_size}"
  asg_size_max               = "${var.fyndi-f_asg_max_size}"
  asg_load_balancers         = []

  default_tags = "${var.default_tags}"
}
