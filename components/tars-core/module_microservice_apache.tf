module "apache" {
  source = "../../modules/microservice"

  name        = "apache"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id               = "${data.terraform_remote_state.base.vpc_id}"
  availability_zones   = "${data.aws_availability_zones.available.names}"
  subnets_cidrs        = "${var.apache_subnet_cidrs}"

  subnets_route_tables = [
    "${data.terraform_remote_state.base.private_nat_route_table_id}",
  ]
  
  lc_additional_sg_ids = [
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  lc_ami_id        = "${data.aws_ami.apache.image_id}"
  lc_instance_type = "${var.apache_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.apache.rendered}"

  asg_target_group_arns = [ 
    "${aws_alb_target_group.apache-80.id}",
  ]

  asg_size_min               = "${var.apache_asg_min_size}"
  asg_size_desired_on_create = "${var.apache_asg_min_size}"
  asg_size_max               = "${var.apache_asg_max_size}"

  default_tags = "${var.default_tags}"

  asg_default_tags  = [
    "${var.asg_default_tags}",
  ]
}
