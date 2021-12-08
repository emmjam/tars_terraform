module "jenkins_blue" {
  source = "../../modules/microservice-old"

  name        = "${var.module}-b"
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id               = var.vpc_id
  availability_zones   = slice(var.availability_zones, 0, length(var.availability_zones))
  subnets_cidrs        = var.jenkins_blue_subnet_cidrs
  subnets_route_tables = var.private_route_table_ids

  lc_ami_id        = var.lc_ami_id
  lc_instance_type = var.lc_instance_type

  #lc_spot_price    = "${var.lc_blue_spot_price}"
  lc_user_data = data.cloudinit_config.jenkins_blue.rendered
  lc_key_name  = var.lc_key_name

  lc_additional_sg_ids = concat(
    var.lc_additional_sg_ids,
    tolist([aws_security_group.jenkins.id])
  )

  asg_size_min               = 0
  asg_size_desired_on_create = var.jenkins_blue_nodes_number
  asg_size_max               = 1
  asg_load_balancers         = [var.jenkins_bg_active == "blue" ? aws_elb.jenkins.name : ""]
  asg_target_group_arns      = var.jenkins_target_group

  default_tags = var.default_tags
}

