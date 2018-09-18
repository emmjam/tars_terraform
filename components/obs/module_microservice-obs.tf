module "obs" {
  source = "../../modules/microservice"

  name        = "obs"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id             = "${data.terraform_remote_state.base.vpc_id}"
  availability_zones = "${data.aws_availability_zones.available.names}"

  subnets_cidrs                   = "${var.obs_subnets_cidrs}"
  subnets_route_tables            = ["${data.terraform_remote_state.base.private_nat_route_table_id}"]

  lc_ami_id        = "${data.aws_ami.obs.image_id}"
  lc_instance_type = "${var.obs_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.obs.rendered}"

  asg_target_group_arns = [
        "${aws_alb_target_group.obs-8080.id}",
        "${aws_alb_target_group.obs-internal-8080.id}",
        ]

  lc_additional_sg_ids = [
    "${aws_security_group.obs.id}",
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  asg_size_min               = "${var.obs_asg_min_size}"
  asg_size_desired_on_create = "${var.obs_asg_min_size}"
  asg_size_max               = "${var.obs_asg_max_size}"
  asg_load_balancers         = []

  default_tags      = "${var.default_tags}"
  asg_default_tags  = [
    "${var.asg_default_tags}",
  ]
}
