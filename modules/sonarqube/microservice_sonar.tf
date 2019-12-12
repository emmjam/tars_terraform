module "microservice_sonarqube" {
  source = "../../modules/microservice"

  name        = var.module
  project     = var.project
  environment = var.environment
  component   = var.component
  region      = var.region

  vpc_id               = var.vpc_id
  availability_zones   = var.aws_availability_zones
  subnets_cidrs        = var.sq_subnets_cidrs
  subnets_route_tables = var.routing_table

  lc_ami_id            = var.sq_ami_id
  lc_instance_type     = var.sq_instance_type
  lc_user_data         = data.template_cloudinit_config.user_data.rendered
  lc_additional_sg_ids = var.lc_additional_sg_ids

  asg_size_min               = var.sq_asg_size_min
  asg_size_desired_on_create = var.sq_asg_size_desired
  asg_size_max               = var.sq_asg_size_max

  default_tags = var.default_tags
  asg_default_tags = var.asg_default_tags
}

