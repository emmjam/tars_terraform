module "gitlab" {
  source = "../../modules/microservice-old"

  name        = var.name
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id               = var.vpc_id
  availability_zones   = var.availability_zones
  subnets_cidrs        = var.gitlab_subnet_cidrs
  subnets_route_tables = var.gitlab_private_route_table_ids

  lc_ami_id            = var.lc_ami_id
  lc_instance_type     = var.lc_instance_type
  lc_user_data         = data.template_cloudinit_config.gitlab.rendered
  lc_additional_sg_ids = var.lc_additional_sg_ids

  asg_size_min               = 0
  asg_size_desired_on_create = 1
  asg_size_max               = 1

  asg_load_balancers = [
    aws_elb.gitlab_public.id,
    aws_elb.gitlab_private.id,
  ]

  default_tags = var.default_tags
}

