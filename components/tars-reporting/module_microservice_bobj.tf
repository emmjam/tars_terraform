module "bobj" {
  source = "../../modules/microservice-old"

  name        = "bobj"
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id = data.terraform_remote_state.base.outputs.vpc_id

  availability_zones = data.aws_availability_zones.available.names

  subnets_cidrs = var.bobj_subnets_cidrs

  subnets_route_tables = data.terraform_remote_state.base.outputs.private_nat_route_table_id

  lc_ami_id        = data.aws_ami.bobj.image_id
  lc_instance_type = var.bobj_instance_type
  lc_user_data     = templatefile("${path.module}/templates/bobj_setup.ps1.tmpl", 
      {
        SEARCH_SUFFIX = local.vpc_domain_name
      })

  asg_target_group_arns = [
    aws_alb_target_group.bobj-8080.arn,
  ]

  lc_additional_sg_ids = [
    aws_security_group.bobj.id,
    aws_security_group.bobj-ad.id,
    data.terraform_remote_state.base.outputs.core_sg_id,
  ]

  asg_size_min               = var.bobj_asg_min_size
  asg_size_desired_on_create = var.bobj_asg_min_size
  asg_size_max               = var.bobj_asg_max_size
  asg_load_balancers         = []

  default_tags = local.default_tags

  asg_default_tags = local.asg_default_tags
}

